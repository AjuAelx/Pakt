import 'dart:convert';
import 'package:http/http.dart' as http;
import "package:pakt/utils/prefs_manager.dart";

class WebClient {
  static final ip = "http://13.232.126.64";


  static Future<dynamic> post(url, data) async {
   var token = await PrefManager.getToken();
    Map? sendData = {};
    if (data?.isNotEmpty ?? false) {
      sendData.addAll(data);
    }

    var body = json.encode(sendData);
    var response = await http.post(
      Uri.parse(ip + url),
      headers: {
        "Content-Type": "application/json",
        "token": token ?? ""
      },
      body: body,

    );

    if (response.statusCode == 200) {
      print(response.body);
      return jsonDecode(response.body);

    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }

  static Future<dynamic> get(url) async {
    var token = await PrefManager.getToken();
    var response = await http.get(Uri.parse(ip + url), headers: {
      "Content-Type": "application/json",
    "token": token ?? ""
    });

    // print(response.body);
    if (response.statusCode == 200) {

      return jsonDecode(response.body);
    } else {
      var error = {
        "status": false,
        "msg": "Invalid Request",
      };
      return error;
    }
  }
}
