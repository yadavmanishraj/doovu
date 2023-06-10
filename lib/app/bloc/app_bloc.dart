import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(const AppState()) {
    on<AppConnectionStatusChangedEvent>(_onConnectivityChanged);
    on<AppInitialized>(_onAppInitialized);
  }

  FutureOr<void> _onConnectivityChanged(
      AppConnectionStatusChangedEvent event, Emitter<AppState> emit) {}

  FutureOr<void> _onAppInitialized(
      AppInitialized event, Emitter<AppState> emit) async {
    var conn = await Connectivity().checkConnectivity();
    add(AppConnectionStatusChangedEvent(connectivityResult: conn));

    Connectivity().onConnectivityChanged.listen((event) {
      add(AppConnectionStatusChangedEvent(connectivityResult: event));
    });
  }
}
