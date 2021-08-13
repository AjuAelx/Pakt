import 'package:equatable/equatable.dart';


abstract class GetOtpState extends Equatable {
  @override
  List<Object> get props => [];
}

class GetOtpInitial extends GetOtpState{}
class SendingOtp extends GetOtpState{}
class PhoneSuccess extends GetOtpState{}
class OtpsendError extends GetOtpState {
  final String error;
  OtpsendError({required this.error});
  @override
  List<Object> get props => [];
}

class StartLoading extends GetOtpInitial{}

class LoginSuccess extends GetOtpState {
  final String currentRole, profileStatus;
  final int level;
  LoginSuccess(
      {required this.currentRole,
      required this.profileStatus,
      required this.level});
  @override
  List<Object> get props => [];
}

class LoginError extends GetOtpState {
  final String error;
  LoginError({required this.error});
  @override
  List<Object> get props => [];
}