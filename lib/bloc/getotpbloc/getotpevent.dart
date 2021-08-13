import 'package:equatable/equatable.dart';
abstract class GetOtpEvent extends Equatable{
  @override
  List<Object> get props => [];

}
class GetOtp extends GetOtpEvent{
  final String number,accessType;

  GetOtp({required this.number,required this.accessType});
  @override
  List<Object> get props => [];
}

class Verify extends GetOtpEvent {
  final String number;
  final String otp;
  final String role;
  final String accessType;
  Verify(
      {required this.number,
      required this.otp,
      required this.role,
      required this.accessType});
  @override
  List<Object> get props => [];
}