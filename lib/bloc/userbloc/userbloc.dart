import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/userbloc/userevent.dart';
import 'package:pakt/bloc/userbloc/userstate.dart';

import 'package:pakt/data/models/view_profile_model.dart';
import 'package:pakt/repositories/repositories.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
     if (event is GetUser) {
    yield GetingUserData();
    UserModel userModel;
    userModel = await Repository().getUser(url: '/user/profile');
    print(userModel.status);
    print(userModel.msg);
    if (userModel.status == true) {
    yield UserDataAvailabale(userData: userModel);
    }
    }

  }
}