class SellerProfileModel2Main {
  bool? status;
  String? msg;
  int? length;
  List<Data>? data;

  SellerProfileModel2Main({
      this.status, 
      this.msg, 
      this.length, 
      this.data});

  SellerProfileModel2Main.fromJson(dynamic json) {
    status = json['status'];
    msg = json['msg'];
    length = json['length'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['status'] = status;
    map['msg'] = msg;
    map['length'] = length;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  List<dynamic>? sliderImages;
  String? status;
  String? id;
  String? mainCategoryId;
  String? name;
  String? createDate;
  String? updateDate;
  int? v;

  Data({
      this.sliderImages, 
      this.status, 
      this.id, 
      this.mainCategoryId, 
      this.name, 
      this.createDate, 
      this.updateDate, 
      this.v});

  Data.fromJson(dynamic json) {
    if (json['sliderImages'] != null) {
      sliderImages = [];
      //recheck
    }
    status = json['status'];
    id = json['_id'];
    mainCategoryId = json['mainCategoryId'];
    name = json['name'];
    createDate = json['create_date'];
    updateDate = json['update_date'];
    v = json['__v'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (sliderImages != null) {
      map['sliderImages'] = sliderImages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['_id'] = id;
    map['mainCategoryId'] = mainCategoryId;
    map['name'] = name;
    map['create_date'] = createDate;
    map['update_date'] = updateDate;
    map['__v'] = v;
    return map;
  }

}