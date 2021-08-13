import 'package:equatable/equatable.dart';


abstract class UpdateProfileState extends Equatable {
  @override
  List<Object> get props => [];
}

class UpdateProfileInitial extends UpdateProfileState{}
class UpdatingProfile extends UpdateProfileState{}
class UpdateSuccess extends UpdateProfileState{}
class UpdateError extends UpdateProfileState {
  final String error;
  UpdateError({required this.error});
  @override
  List<Object> get props => [];
}