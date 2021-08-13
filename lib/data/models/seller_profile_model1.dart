class SellerProfileModel1 {
  bool? status;
  String? msg;
  String? profileStatus;
  int? level;

  SellerProfileModel1({
      this.status, 
      this.msg, 
      this.profileStatus, 
      this.level});

  SellerProfileModel1.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    profileStatus = json['profileStatus'];
    level = json['level'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['profileStatus'] = profileStatus;
    map['level'] = level;
    return map;
  }

}