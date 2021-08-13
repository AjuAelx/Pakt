import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofileevent.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofilestate.dart';
import 'package:pakt/data/models/seller_profile_model1.dart';

import 'package:pakt/repositories/repositories.dart';




class SellerProfileBloc extends Bloc<SellerProfileEvent, SellerProfileState> {
  SellerProfileBloc() : super(SellerProfileInitial());

  @override
  Stream<SellerProfileState> mapEventToState(SellerProfileEvent event) async* {
    if (event is SellerProfile1) {
      yield UpdatingProfile1();
      SellerProfileModel1 sellerProfileModel1;
      Map map = {

        "shopName": event.shopName,
        "description": event.description,
        "place": event.place,
        "city": event.city,
        "pincode": event.pincode,
        "contactPerson": event.contactPerson,
        "email": event.email,
        "whatsapp": event.whatsapp,
        "instagram":event.instagram,
        "facebook":event.facebook,
        "lat": "9.590616",
        "lon":"76.522583"
      };
      var url = '/seller/profile/level1';
      sellerProfileModel1 = await Repository().sellerprofile1(url: url,data:map);
      if (sellerProfileModel1.status == true) {
        yield UpdateSuccess1();
      }
      else {
        yield UpdateError1(error: sellerProfileModel1.msg.toString());
      }
    }

  }
}