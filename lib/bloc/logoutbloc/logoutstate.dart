import 'package:equatable/equatable.dart';


abstract class LogoutState extends Equatable {
  @override
  List<Object> get props => [];
}

class LogoutInitial extends LogoutState{}

class LogoutSuccess extends LogoutState{}
class LogoutError extends LogoutState {
  final String error;
  LogoutError({required this.error});
  @override
  List<Object> get props => [];
}