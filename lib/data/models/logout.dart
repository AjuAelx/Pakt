class LogoutModel {
  bool? status;
  bool? expired;
  String? msg;

  LogoutModel({
      this.status, 
      this.expired, 
      this.msg});

  LogoutModel.fromJson(dynamic json) {
    status = json['status'];
    expired = json['expired'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['expired'] = expired;
    map['msg'] = msg;
    return map;
  }

}