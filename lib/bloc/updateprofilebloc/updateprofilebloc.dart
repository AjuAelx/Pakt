import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofileevent.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofilestate.dart';
import 'package:pakt/data/models/update_profile_user.dart';
import 'package:pakt/repositories/repositories.dart';




class UpdateProfileBloc extends Bloc<UpdateProfileEvent, UpdateProfileState> {
  UpdateProfileBloc() : super(UpdateProfileInitial());

  @override
  Stream<UpdateProfileState> mapEventToState(UpdateProfileEvent event) async* {
    if (event is UpdateProfile) {
       yield UpdatingProfile();
      UpdateProfileUser updateProfileUser;
       Map map = {

         "firstName": event.firstName,
         "lastName": event.lastName,
         "email": event.email,
         "gender": event.gender,
         "address": event.address,
         "street": event.street,
         "landmark": event.landmark,
         "pincode": event.pincode,
         "lat": event.lat,
         "lon":event.lon
       };
      var url = '/customer/profile/update';
       updateProfileUser = await Repository().updateprofile(url: url,data:map);
      if (updateProfileUser.status == true) {
        yield UpdateSuccess();
      }
      else {
        yield UpdateError(error: updateProfileUser.msg.toString());
      }
    }

  }
}