import 'package:equatable/equatable.dart';


abstract class SellerProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class SellerProfileInitial extends SellerProfileState{}
class UpdatingProfile1 extends SellerProfileState{}
class UpdateSuccess1 extends SellerProfileState{}
class UpdateError1 extends SellerProfileState {
  final String error;
  UpdateError1({required this.error});
  @override
  List<Object> get props => [];
}