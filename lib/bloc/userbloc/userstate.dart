import 'package:equatable/equatable.dart';

import 'package:pakt/data/models/view_profile_model.dart';
abstract class UserState extends Equatable{
  @override
  List<Object> get props => [];

}
class UserInitial extends UserState{}
class GetingUserData extends UserState{}

class UserDataAvailabale extends UserState {
  final UserModel? userData;
  UserDataAvailabale({required this.userData});
}