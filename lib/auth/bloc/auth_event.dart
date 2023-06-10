// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthEventInitialized extends AuthEvent {}

class AuthEventRegisterRequested extends AuthEvent {
  final String name;
  final String email;
  final String password;
  const AuthEventRegisterRequested({
    required this.name,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [name, email, password];
}

class AuthEventLoginRequested extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLoginRequested({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
