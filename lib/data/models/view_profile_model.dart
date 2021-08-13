/// status : true
/// msg : "User details retrieved Successfully"
/// role : "Customer"
/// profileStatus : "Active"
/// level : 0
/// data : {"role":"Customer","usertype":0,"location":[76.70902870595455,9.567402667904853],"status":"Active","level":0,"_id":"6107deb44b2c511c18a36922","phone":"1234567890","create_date":"2021-08-02T12:01:56.707Z","update_date":"2021-08-07T05:28:40.561Z","__v":1,"customerid":{"location":[76.70902870595455,9.567402667904853],"photo":"propic.jpg","_id":"610e1a0872009d8e277ac2b7","uid":"6107deb44b2c511c18a36922","firstName":"Jimmy","lastName":"Anderson","email":"jimmy@gmail.com","gender":"Male","address":"Thiruvalla","street":"3","landmark":"Near Post Office","pincode":"686000","create_date":"2021-08-07T05:28:40.555Z","update_date":"2021-08-07T05:28:40.555Z","__v":0}}

class UserModel {
  bool? _status;
  String? _msg;
  String? _role;
  String? _profileStatus;
  int? _level;
  Data? _data;

  bool? get status => _status;
  String? get msg => _msg;
  String? get role => _role;
  String? get profileStatus => _profileStatus;
  int? get level => _level;
  Data? get data => _data;

  UserModel({
      bool? status, 
      String? msg, 
      String? role, 
      String? profileStatus, 
      int? level, 
      Data? data}){
    _status = status;
    _msg = msg;
    _role = role;
    _profileStatus = profileStatus;
    _level = level;
    _data = data;
}

  UserModel.fromJson(dynamic json) {
    _status = json['status'];
    _msg = json['msg'];
    _role = json['role'];
    _profileStatus = json['profileStatus'];
    _level = json['level'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = _status;
    map['msg'] = _msg;
    map['role'] = _role;
    map['profileStatus'] = _profileStatus;
    map['level'] = _level;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// role : "Customer"
/// usertype : 0
/// location : [76.70902870595455,9.567402667904853]
/// status : "Active"
/// level : 0
/// _id : "6107deb44b2c511c18a36922"
/// phone : "1234567890"
/// create_date : "2021-08-02T12:01:56.707Z"
/// update_date : "2021-08-07T05:28:40.561Z"
/// __v : 1
/// customerid : {"location":[76.70902870595455,9.567402667904853],"photo":"propic.jpg","_id":"610e1a0872009d8e277ac2b7","uid":"6107deb44b2c511c18a36922","firstName":"Jimmy","lastName":"Anderson","email":"jimmy@gmail.com","gender":"Male","address":"Thiruvalla","street":"3","landmark":"Near Post Office","pincode":"686000","create_date":"2021-08-07T05:28:40.555Z","update_date":"2021-08-07T05:28:40.555Z","__v":0}

class Data {
  String? _role;
  int? _usertype;
  List<double>? _location;
  String? _status;
  int? _level;
  String? _id;
  String? _phone;
  String? _createDate;
  String? _updateDate;
  int? _v;
  Customerid? _customerid;

  String? get role => _role;
  int? get usertype => _usertype;
  List<double>? get location => _location;
  String? get status => _status;
  int? get level => _level;
  String? get id => _id;
  String? get phone => _phone;
  String? get createDate => _createDate;
  String? get updateDate => _updateDate;
  int? get v => _v;
  Customerid? get customerid => _customerid;

  Data({
      String? role, 
      int? usertype, 
      List<double>? location, 
      String? status, 
      int? level, 
      String? id, 
      String? phone, 
      String? createDate, 
      String? updateDate, 
      int? v, 
      Customerid? customerid}){
    _role = role;
    _usertype = usertype;
    _location = location;
    _status = status;
    _level = level;
    _id = id;
    _phone = phone;
    _createDate = createDate;
    _updateDate = updateDate;
    _v = v;
    _customerid = customerid;
}

  Data.fromJson(dynamic json) {
    _role = json['role'];
    _usertype = json['usertype'];
    _location = json['location'] != null ? json['location'].cast<double>() : [];
    _status = json['status'];
    _level = json['level'];
    _id = json['_id'];
    _phone = json['phone'];
    _createDate = json['create_date'];
    _updateDate = json['update_date'];
    _v = json['__v'];
    _customerid = json['customerid'] != null ? Customerid.fromJson(json['customerid']) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['role'] = _role;
    map['usertype'] = _usertype;
    map['location'] = _location;
    map['status'] = _status;
    map['level'] = _level;
    map['_id'] = _id;
    map['phone'] = _phone;
    map['create_date'] = _createDate;
    map['update_date'] = _updateDate;
    map['__v'] = _v;
    if (_customerid != null) {
      map['customerid'] = _customerid?.toJson();
    }
    return map;
  }

}

/// location : [76.70902870595455,9.567402667904853]
/// photo : "propic.jpg"
/// _id : "610e1a0872009d8e277ac2b7"
/// uid : "6107deb44b2c511c18a36922"
/// firstName : "Jimmy"
/// lastName : "Anderson"
/// email : "jimmy@gmail.com"
/// gender : "Male"
/// address : "Thiruvalla"
/// street : "3"
/// landmark : "Near Post Office"
/// pincode : "686000"
/// create_date : "2021-08-07T05:28:40.555Z"
/// update_date : "2021-08-07T05:28:40.555Z"
/// __v : 0

class Customerid {
  List<double>? _location;
  String? _photo;
  String? _id;
  String? _uid;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _gender;
  String? _address;
  String? _street;
  String? _landmark;
  String? _pincode;
  String? _createDate;
  String? _updateDate;
  int? _v;

  List<double>? get location => _location;
  String? get photo => _photo;
  String? get id => _id;
  String? get uid => _uid;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get gender => _gender;
  String? get address => _address;
  String? get street => _street;
  String? get landmark => _landmark;
  String? get pincode => _pincode;
  String? get createDate => _createDate;
  String? get updateDate => _updateDate;
  int? get v => _v;

  Customerid({
      List<double>? location, 
      String? photo, 
      String? id, 
      String? uid, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? gender, 
      String? address, 
      String? street, 
      String? landmark, 
      String? pincode, 
      String? createDate, 
      String? updateDate, 
      int? v}){
    _location = location;
    _photo = photo;
    _id = id;
    _uid = uid;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _gender = gender;
    _address = address;
    _street = street;
    _landmark = landmark;
    _pincode = pincode;
    _createDate = createDate;
    _updateDate = updateDate;
    _v = v;
}

  Customerid.fromJson(dynamic json) {
    _location = json['location'] != null ? json['location'].cast<double>() : [];
    _photo = json['photo'];
    _id = json['_id'];
    _uid = json['uid'];
    _firstName = json['firstName'];
    _lastName = json['lastName'];
    _email = json['email'];
    _gender = json['gender'];
    _address = json['address'];
    _street = json['street'];
    _landmark = json['landmark'];
    _pincode = json['pincode'];
    _createDate = json['create_date'];
    _updateDate = json['update_date'];
    _v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['location'] = _location;
    map['photo'] = _photo;
    map['_id'] = _id;
    map['uid'] = _uid;
    map['firstName'] = _firstName;
    map['lastName'] = _lastName;
    map['email'] = _email;
    map['gender'] = _gender;
    map['address'] = _address;
    map['street'] = _street;
    map['landmark'] = _landmark;
    map['pincode'] = _pincode;
    map['create_date'] = _createDate;
    map['update_date'] = _updateDate;
    map['__v'] = _v;
    return map;
  }

}