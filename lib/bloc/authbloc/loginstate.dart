import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class TokensCleared extends LoginState {}

class Loading extends LoginState {}

class AuthConfirmed extends LoginState {
  final String crole, pstatus;
  final int clevel;
  AuthConfirmed(
      {required this.crole, required this.pstatus, required this.clevel});
  @override
  List<Object> get props => [];
}

class AuthNotConfirmed extends LoginState {
  @override
  List<Object> get props => [];
}
