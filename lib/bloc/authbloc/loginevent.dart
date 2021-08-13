import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class AuthCheck extends LoginEvent {}

class DoLogout extends LoginEvent {}

class ProfileStatusCheck extends LoginEvent {}

class RoleCheck extends LoginEvent {
  @override
  List<Object> get props => [];
}


