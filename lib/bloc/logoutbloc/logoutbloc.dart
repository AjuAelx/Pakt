import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/logoutbloc/logoutevent.dart';
import 'package:pakt/bloc/logoutbloc/logoutstate.dart';
import 'package:pakt/data/models/logout.dart';
import 'package:pakt/repositories/repositories.dart';


class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  LogoutBloc() : super(LogoutInitial());

  @override
  Stream<LogoutState> mapEventToState(LogoutEvent event) async* {
    if (event is Logout) {
      LogoutModel logoutmodel;

      var url = '/user/logout';
      logoutmodel = await Repository().logout(url: url);
      if (logoutmodel.status == true) {
        yield LogoutSuccess();
      }
      else {
        yield LogoutError(error: logoutmodel.msg.toString());
      }
    }
  }
}