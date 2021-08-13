class UpdateProfileUser {
  bool? _status;
  String? _msg;
  String? _profileStatus;
  int? _level;

  bool? get status => _status;
  String? get msg => _msg;
  String? get profileStatus => _profileStatus;
  int? get level => _level;

  UpdateProfileUser({
      bool? status, 
      String? msg, 
      String? profileStatus, 
      int? level}){
    _status = status;
    _msg = msg;
    _profileStatus = profileStatus;
    _level = level;
}

  UpdateProfileUser.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _profileStatus = json['profileStatus'];
    _level = json['level'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['profileStatus'] = _profileStatus;
    map['level'] = _level;
    return map;
  }

}