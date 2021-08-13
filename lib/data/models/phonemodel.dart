
class PhoneModel {
  bool? status;
  bool? alreadyExists;

  String? msg;


  PhoneModel({
    this.status,
    this.alreadyExists,

    this.msg,
   
  });
  factory PhoneModel.fromJson(Map<String, dynamic> json) =>
      PhoneModel(
        status: json['status'] as bool?,
        alreadyExists: json['alreadyExists'] as bool?,

        msg: json['msg'] as String?,

      );

  Map<String, dynamic> toJson() => {
    'status': status,
    'alreadyExists': alreadyExists,

    'msg': msg,

  };
}