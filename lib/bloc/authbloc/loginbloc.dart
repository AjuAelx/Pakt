import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/authbloc/loginstate.dart';
import 'package:pakt/data/models/loginmodel.dart';

import 'package:pakt/bloc/authbloc/loginevent.dart';
import 'package:pakt/utils/prefs_manager.dart';

class AuthBloc extends Bloc<LoginEvent, LoginState> {
  AuthBloc() : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is AuthCheck) {
      final token = await PrefManager.getToken();
      yield token == null
          ? AuthNotConfirmed()
          : AuthConfirmed(
              crole: await PrefManager.getUserRole(),
              pstatus: await PrefManager.getCurrentStatus(),
              clevel: await PrefManager.getSellerLevel());
    }
    if (event is DoLogout) {
      var token = await PrefManager.clearToken();
      if (token == null) {
        yield TokensCleared();
      }
    }
  
  }
}
