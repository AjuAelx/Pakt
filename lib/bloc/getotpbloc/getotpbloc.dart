import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pakt/bloc/getotpbloc/getotpevent.dart';
import 'package:pakt/bloc/getotpbloc/getotpstate.dart';
import 'package:pakt/data/models/loginmodel.dart';
import 'package:pakt/data/models/phonemodel.dart';
import 'package:pakt/repositories/repositories.dart';
import 'package:pakt/utils/prefs_manager.dart';

class GetOtpBloc extends Bloc<GetOtpEvent, GetOtpState> {
  GetOtpBloc() : super(GetOtpInitial());

  @override
  Stream<GetOtpState> mapEventToState(GetOtpEvent event) async* {
    if (event is GetOtp) {
      yield SendingOtp();
      PhoneModel phoneModel;
      var url = '/user/signup/signin/send/otp?phone=' +
          event.number.toString() +
          "&accessType=" +
          event.accessType;
      phoneModel = await Repository().getotp(url: url);
      if (phoneModel.status == true) {
        yield PhoneSuccess();
      } else {
        yield OtpsendError(error: phoneModel.msg.toString());
      }
    }

    if (event is Verify) {
      yield StartLoading();
      print("start loading");
      LoginModel loginModel;

      Map map = {
        "phone": event.number,
        "otp": event.otp,
        "role": event.role,
        "accessType": event.accessType
      };
      print(map);
      loginModel =
          await Repository().login(url: '/user/signup/signin', data: map);
      if (loginModel.status == true) {
        await PrefManager.setToken(loginModel.token);
        await PrefManager.setUserRole(loginModel.role.toString());
        await PrefManager.setSellerLevel(loginModel.level!.toInt());
        await PrefManager.setCurrentStatus(loginModel.profileStatus.toString());
        yield LoginSuccess(
            currentRole: loginModel.role.toString(),
            profileStatus: loginModel.profileStatus.toString(),
            level: loginModel.level!.toInt());
      } else {
        yield LoginError(error: loginModel.msg.toString());
      }
    }
  }
}
