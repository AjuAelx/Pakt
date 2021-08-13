
class LoginModel {
  bool? status;
  bool? alreadyExists;
  String? role;
  String? profileStatus;
  int? level;
  String? msg;
  String? token;

  LoginModel({
    this.status,
    this.alreadyExists,
    this.role,
    this.profileStatus,
    this.level,
    this.msg,
    this.token,
  });
  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      LoginModel(
        status: json['status'] as bool?,
        alreadyExists: json['alreadyExists'] as bool?,
        role: json['role'] as String?,
        profileStatus: json['profileStatus'] as String?,
        level: json['level'] as int?,
        msg: json['msg'] as String?,
        token: json['token'] as String?,
      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'alreadyExists': alreadyExists,
    'role': role,
    'profileStatus': profileStatus,
    'level':level,
    'msg': msg,
    'token': token,
  };
}
