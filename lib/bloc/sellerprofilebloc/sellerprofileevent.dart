import 'package:equatable/equatable.dart';
abstract class SellerProfileEvent extends Equatable{
  @override
  List<Object> get props => [];

}
class SellerProfile1 extends SellerProfileEvent{
  final String shopName;
  final String description ;
  final String place;
  final String city;
  final String pincode;
  final String email;
  final String contactPerson;
  final String whatsapp,facebook,instagram;
  final String lat;
  final String lon;
  SellerProfile1({required this.shopName,required this.description,
    required this.place,required this.city,required this.pincode,
    required this.email,required this.contactPerson,required this.whatsapp,required this.instagram,required this.facebook,
    required this.lat,required this.lon});
  @override
  List<Object> get props => [];
}