import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofilebloc.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofileevent.dart';
import 'package:pakt/bloc/sellerprofilebloc/sellerprofilestate.dart';
import 'package:pakt/ui/sellerui/profilelevel2.dart';
import 'package:pakt/ui/sellerui/profilelevel3.dart';
import 'package:pakt/utils/mappicker.dart';
import 'package:pakt/utils/prefs_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileLevel1 extends StatefulWidget {
  const ProfileLevel1({Key? key}) : super(key: key);

  @override
  _ProfileLevel1State createState() => _ProfileLevel1State();
}

class _ProfileLevel1State extends State<ProfileLevel1> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng? _center;
  final shopName = TextEditingController();
  final description = TextEditingController();
  final place = TextEditingController();
  final city = TextEditingController();
  final email = TextEditingController();
  final pincode = TextEditingController();
  final whatsapp = TextEditingController();
  final contactPerson = TextEditingController();
  final facebook = TextEditingController();
  final instagram = TextEditingController();

  void _onCameraMove(CameraPosition position) {
    _center = position.target;
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Complete Your Profile',
          style: TextStyle(fontSize: 16, fontFamily: 'RobotoM'),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "Account Information Progress",
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'RobotoB',
                    fontSize: 16),
              ),
              SizedBox(height: 20,),
              Center(
                child: MyCustomContainer(
                  progress: 0.25,
                  size: MediaQuery
                      .of(context)
                      .size
                      .width-30,
                  backgroundColor: Colors.grey,
                  progressColor: Color(0xffFFCC00),
                ),
              ),
              SizedBox(height: 10,),
              Text("1/4 Steps"),
              SizedBox(height: 30,),
              // Container(
              //     child: Column(
              //       children: [
              //         SizedBox(
              //           height: 25,
              //         ),
              //
              //         imageFileProfile == null ? CircleAvatar(
              //
              //           radius: 50,
              //         ):CircleAvatar(
              //           backgroundImage: FileImage(imageFileProfile!,scale: 1),
              //           radius: 50,
              //         ),
              //         Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: InkWell(
              //             child: Container(
              //                 height: 24,
              //                 width: 70,
              //                 padding: const EdgeInsets.all(3.0),
              //                 decoration: BoxDecoration(
              //                   border: Border.all(color: Color(0xffFFC917)),
              //                   borderRadius: BorderRadius.circular(10),
              //                 ),
              //                 child: Center(
              //                   child: Text(
              //                     'Upload Image',
              //                     style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: 10,
              //                         fontFamily: 'RobotoM'),
              //                   ),
              //                 )),
              //             onTap: () {
              //               showModalBottomSheet(
              //                   context: context,
              //                   builder: (context) {
              //                     return Column(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: <Widget>[
              //                         ListTile(
              //                           leading: new Icon(Icons.camera_alt),
              //                           title: new Text('Pick from camera',style: TextStyle(fontFamily: 'RobotoM'),),
              //                           onTap: () {
              //                             Navigator.pop(context);
              //                             _getFromCamera();
              //                           },
              //                         ),
              //                         ListTile(
              //                           leading: new Icon(Icons.photo),
              //
              //                           title: new Text('Pick from gallery',style: TextStyle(fontFamily: 'RobotoM'),),
              //                           onTap: () {
              //                             Navigator.pop(context);
              //                             _getFromGallery();
              //                           },
              //                         ),
              //
              //                       ],
              //                     );
              //                   });
              //             },
              //           ),
              //         ),
              //       ],
              //
              //    )),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      color: Color(0xffFFCF30),
                      size: 15,
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'RobotoB'),
                    )
                  ],
                ),
              ),
              Divider(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: shopName,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Shop Name',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: description,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: place,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Location',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: city,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'City',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: pincode,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Pincode',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              _center == null
                  ? Container(
                      height: 80,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  size: 15,
                                  color: Color(0xffFFCC00),
                                ),
                                Text(
                                  "Shop Address",
                                  style: TextStyle(
                                      fontSize: 10, fontFamily: 'RobotoB'),
                                ),
                              ],
                            ),
                          ),
                          MaterialButton(
                            minWidth: MediaQuery.of(context).size.width - 20,
                            height: 35,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(0.0),
                              ),
                            ),
                            onPressed: () async {
                              Map d = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapPick()));
                              print(d["lat"]);
                              print(d["lon"]);
                              _center = LatLng(d["lat"], d["lon"]);
                              // _onCameraMove(CameraPosition(target: _center!));

                              _goToTheLake(_center!);
                              setState(() {});
                            },
                            color: new Color(0xff000000),
                            child: Text(
                              "Choose Location from map",
                              style: TextStyle(
                                  color: Color(0xffFFF4F4),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 9,
                                  fontFamily: 'RobotoM'),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 200,
                        width: double.infinity,
                        child: Stack(
                          children: [
                            GoogleMap(
                              mapType: MapType.normal,
                              markers: _markers,
                              initialCameraPosition: CameraPosition(
                                target: _center!,
                                zoom: 11.0,
                              ),
                              zoomControlsEnabled: false,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        MaterialButton(
                                          minWidth: 140,
                                          height: 31,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(0.0),
                                            ),
                                          ),
                                          onPressed: () async {
                                            Map d = await Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MapPick()));
                                            print(d["lat"]);
                                            print(d["lon"]);
                                            _center =
                                                LatLng(d["lat"], d["lon"]);
                                            //  _onCameraMove(CameraPosition(target: _center!));
                                            _goToTheLake(_center!);
                                            setState(() {});
                                          },
                                          color: Colors.black,
                                          child: Text(
                                            "Change Location",
                                            style: TextStyle(
                                                color: Color(0xffFFF4F4),
                                                fontWeight: FontWeight.w600,
                                                fontSize: 9,
                                                fontFamily: 'RobotoM'),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: email,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: whatsapp,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'WhatsApp Number',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: contactPerson,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Contact Person',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: instagram,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Instagram URL',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: MediaQuery.of(context).size.width - 20,
                  child: TextFormField(
                    controller: facebook,
                    showCursor: true,
                    cursorColor: Colors.yellow,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RobotoB'),
                    decoration: InputDecoration(
                      fillColor: Color(0xffF8F8F8),
                      filled: true,
                      labelText: 'Facebook URL',
                      labelStyle: TextStyle(color: Color(0xffA3A3A3)),
                      contentPadding: const EdgeInsets.all(10),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width - 70,
                        height: 45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(0.0),
                          ),
                        ),
                        onPressed: () async {
                          // if (_center == null)
                          //   Fluttertoast.showToast(
                          //     msg: "Pick Shop Location",
                          //     gravity: ToastGravity.CENTER,
                          //     backgroundColor: Colors.black,
                          //     textColor: Colors.white,
                          //     fontSize: 12.0,
                          //   );
                          // else
                            if (shopName.text.isEmpty ||
                              shopName.text == "" ||
                              description.text.isEmpty ||
                              description.text == "" ||
                              city.text.isEmpty ||
                              city.text == "" ||
                              place.text.isEmpty ||
                              place.text == "" ||
                              pincode.text.isEmpty ||
                              pincode.text == "" ||
                              email.text.isEmpty ||
                              email.text == "" ||
                              whatsapp.text.isEmpty ||
                              whatsapp.text == "" ||
                              contactPerson.text.isEmpty ||
                              contactPerson.text == "" ||
                              instagram.text.isEmpty ||
                              instagram.text == "" ||
                              facebook.text.isEmpty ||
                              facebook.text == "")
                            Fluttertoast.showToast(
                              msg: "Enter All Fields",
                            );
                          else
                            BlocProvider.of<SellerProfileBloc>(context).add(
                                SellerProfile1(
                                    shopName: shopName.text,
                                    description: description.text,
                                    place: place.text,
                                    city: city.text,
                                    contactPerson: contactPerson.text,
                                    email: email.text,
                                    whatsapp: whatsapp.text,
                                    facebook: facebook.text,
                                    instagram: instagram.text,
                                    pincode: pincode.text,
                                    lat: "9.590616",
                                    lon: "76.522583"));
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                        },
                        color: new Color(0xffFFCC00),
                        child: new BlocConsumer<SellerProfileBloc,
                            SellerProfileState>(
                            builder: (context, state) {
                              if (state is UpdatingProfile1) {
                                return SizedBox(
                                  height: 22.0,
                                  width: 22.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.black),
                                    strokeWidth: 2,
                                  ),
                                );
                              } else if (state is UpdateError1) {
                                _showToast(state.error);
                                return new Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      fontFamily: 'RobotoM'),
                                );
                              } else if (state is UpdateSuccess1){
                                  updateLevel(1);
                                SchedulerBinding.instance!
                                    .addPostFrameCallback((_) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProfileLevel2()));
                                });
                              }
                              return new Text(
                                "Next",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                    fontFamily: 'RobotoM'),
                              );
                            },
                            listener: (context, state) {})),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final Set<Marker> _markers = {};

  Future<void> _goToTheLake(LatLng a) async {
    final GoogleMapController controller = await _controller.future;

    controller.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: a, zoom: 13)));
    _markers.add(Marker(
      // This marker id can be anything that uniquely identifies each marker.
      markerId: MarkerId(" "),
      position: a,
      infoWindow: InfoWindow(),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _onCameraMove(
      CameraPosition(target: _center!, zoom: 11),
    );
    setState(() {});
  }

  /// Get from gallery
  // _getFromGallery() async {
  //   // ignore: deprecated_member_use
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFileProfile = File(pickedFile.path);
  //     });
  //   }
  // }
  //
  // /// Get from Camera
  // _getFromCamera() async {
  //   // ignore: deprecated_member_use
  //   PickedFile? pickedFile = await ImagePicker().getImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFileProfile = File(pickedFile.path);
  //     });
  //   }
  // }
  void _showToast(String mssg) {
    Fluttertoast.showToast(
      msg: mssg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
  static updateLevel(int level) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('level', 1);
    print(await PrefManager.getSellerLevel());
  }

}
