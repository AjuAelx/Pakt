
import 'package:shared_preferences/shared_preferences.dart';


class PrefManager {
  static setToken(var token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);

  }
  static getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }
  // static setCurrentUser(String currentUser) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('currentUser', currentUser);
  // }
  // static setCurrentRole(String currentRole) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('currentRole', currentRole);
  // }


  static setUserRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }
  static getUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('role');
  }

  static setSellerLevel(int level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level', level);
  }
  static getSellerLevel() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('level');
  }
  static setCurrentStatus(String profileStatus) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileStatus', profileStatus);
  }
  static getCurrentStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('profileStatus');
  }


  static setCurrentLocation(var loc) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('loc', loc);

  }
  static getCurrentLocation() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('loc');
  }
  static clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();

  }


}
