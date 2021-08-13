import 'package:pakt/data/models/loginmodel.dart';
import 'package:pakt/data/models/logout.dart';
import 'package:pakt/data/models/phonemodel.dart';
import 'package:pakt/data/models/seller_profile_model1.dart';
import 'package:pakt/data/models/update_profile_user.dart';

import 'package:pakt/data/models/view_profile_model.dart';
import 'package:pakt/data/web_client.dart';
import 'package:connectivity/connectivity.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Repository {


  Future<PhoneModel>getotp({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Not connected to internet");
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final PhoneModel phoneModel = PhoneModel.fromJson(response);
    return phoneModel;
  }
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Not connected to internet");
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final LoginModel userModel = LoginModel.fromJson(response);
    return userModel;
  }
  Future<UserModel> getUser({required String url}) async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Not connected to internet");
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url );
    final UserModel userModel = UserModel.fromJson(response);
    return userModel;
  }

Future<UpdateProfileUser> updateprofile({required String url, dynamic data}) async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.none) {
    print("Not connected to internet");
    Fluttertoast.showToast(
      msg: "No internet connection",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
    );
  }
  final dynamic response = await WebClient.post(url,data);
  final UpdateProfileUser updateProfileUser = UpdateProfileUser.fromJson(response);
  return updateProfileUser;
}
  Future<LogoutModel>logout({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Not connected to internet");
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final LogoutModel logoutModel = LogoutModel.fromJson(response);
    return logoutModel;
  }

  Future<SellerProfileModel1> sellerprofile1({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      print("Not connected to internet");
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url,data);
    final SellerProfileModel1 sellerProfileModel1 = SellerProfileModel1.fromJson(response);
    return sellerProfileModel1;
  }
}