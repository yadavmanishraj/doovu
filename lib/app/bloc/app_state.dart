// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'app_bloc.dart';

class AppState extends Equatable {
  final ConnectivityResult connectivityResult;
  const AppState({this.connectivityResult = ConnectivityResult.none});

  @override
  List<Object> get props => [connectivityResult];
}
