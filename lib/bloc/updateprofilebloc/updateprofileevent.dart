import 'package:equatable/equatable.dart';
abstract class UpdateProfileEvent extends Equatable{
  @override
  List<Object> get props => [];

}
class UpdateProfile extends UpdateProfileEvent{
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final String address;
  final String street;
  final String landmark;
  final String pincode;
  final String lat;
  final String lon;
  UpdateProfile({required this.firstName,required this.lastName,
    required this.email,required this.gender,required this.address,
    required this.street,required this.landmark,required this.pincode,
    required this.lat,required this.lon});
  @override
  List<Object> get props => [];
}