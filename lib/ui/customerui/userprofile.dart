import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/userbloc/userbloc.dart';
import 'package:pakt/bloc/userbloc/userevent.dart';
import 'package:pakt/bloc/userbloc/userstate.dart';
import 'package:pakt/data/models/view_profile_model.dart';
class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserBloc>(context).add(GetUser());
  }
  Widget build(BuildContext context) {
    return Scaffold(
    body:  SafeArea(
      child: new BlocConsumer<UserBloc, UserState>(

        builder: (context, state) {
          if (state is GetingUserData) {
            return Center(child: CircularProgressIndicator(color: new Color(0xff68D389),));
          } else if (state is UserDataAvailabale) {
            return _getUser(context, state.userData!);
          } else {
            return Container();
          }
        },
        listener: (context, state) {},
      ),
    ),
    );
  }
}

Widget _getUser(BuildContext context, UserModel s) {
  return Center(
    child: Container(
      child:Column(
        children: [
          Text(s.data!.phone.toString()),
      Text(s.data!.role.toString()),
        ], ),

      )

  );
}
