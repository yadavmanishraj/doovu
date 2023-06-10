import 'dart:async';
import 'dart:developer';
import 'package:doovu/auth/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:appwrite/models.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppWriteAuthService _appWriteAuthService;
  AuthBloc(this._appWriteAuthService) : super(const AuthState()) {
    on<AuthEventInitialized>(_onAuthBlocInitialized);
    on<AuthEventRegisterRequested>(_onAuthRegisterRequested);
    on<AuthEventLoginRequested>(_onAuthLoginRequested);

    add(AuthEventInitialized());
  }

  FutureOr<void> _onAuthRegisterRequested(
      AuthEventRegisterRequested event, emit) async {
    try {
      var user = await _appWriteAuthService.registerWithEmailPassword(
          email: event.email, password: event.password, name: event.name);
      emit(state.copyWith(user: user, isLoading: false));
    } catch (e) {
      log(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onAuthLoginRequested(
      AuthEventLoginRequested event, Emitter<AuthState> emit) async {
    try {
      var user = await _appWriteAuthService.loginWithEmailPassword(
          email: event.email, password: event.password);

      emit(state.copyWith(user: user, isLoading: false));
      log(user.email);
    } catch (e) {
      log("logger");
      log(e.toString());
    }
    emit(state.copyWith(isLoading: false));
  }

  FutureOr<void> _onAuthBlocInitialized(
      AuthEventInitialized event, Emitter<AuthState> emit) async {
    var user = await _appWriteAuthService.initialUser;
    emit(state.copyWith(user: user, isLoading: false));
  }
}
