// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final User? user;
  final bool isLoading;
  const AuthState({this.user, this.isLoading = true});
  @override
  List<Object?> get props => [user, isLoading];

  AuthState copyWith({
    User? user,
    bool? isLoading,
  }) {
    return AuthState(
        user: user ?? this.user, isLoading: isLoading ?? this.isLoading);
  }
}
