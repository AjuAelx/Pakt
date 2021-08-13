import 'dart:async';
import 'dart:io';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofilebloc.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofileevent.dart';
import 'package:pakt/bloc/updateprofilebloc/updateprofilestate.dart';
import 'package:pakt/ui/customerui/homepage.dart';
import '../../utils/mappicker.dart';

class CompleteProfile extends StatefulWidget {
  final String? lat;
  final String? long;

  const CompleteProfile({Key? key, this.lat, this.long}) : super(key: key);

  @override
  _CompleteProfileState createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  File? imageFile;
  Completer<GoogleMapController> _controller = Completer();

  LatLng? _center;
  final firstName=TextEditingController();
  final lastName=TextEditingController();
  final phone=TextEditingController();
  final email=TextEditingController();
  final gender=TextEditingController();
  final address=TextEditingController();
  final street=TextEditingController();
  final landmark=TextEditingController();
  final pincode=TextEditingController();



  void _onCameraMove(CameraPosition position) {
    _center = position.target;
  }

  @override
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
              Container(
                  child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),

                        imageFile == null ? CircleAvatar(

                    radius: 50,
                  ):CircleAvatar(
                    backgroundImage: FileImage(imageFile!),
                    radius: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      child: Container(
                          height: 24,
                          width: 70,
                          padding: const EdgeInsets.all(3.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffFFC917)),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              'Upload Image',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontFamily: 'RobotoM'),
                            ),
                          )),
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: new Icon(Icons.camera_alt),
                                    title: new Text('Pick from camera',style: TextStyle(fontFamily: 'RobotoM'),),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _getFromCamera();
                                    },
                                  ),
                                  ListTile(
                                    leading: new Icon(Icons.photo),

                                    title: new Text('Pick from gallery',style: TextStyle(fontFamily: 'RobotoM'),),
                                    onTap: () {
                                      Navigator.pop(context);
                                      _getFromGallery();
                                    },
                                  ),

                                ],
                              );
                            });
                      },
                    ),
                  ),
                ],
              )),
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
                    controller: firstName,
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
                      labelText: 'First Name',
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
                    controller: lastName,
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
                      labelText: 'Last Name',
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
                      labelText: 'Email Id',
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
                      labelText: 'Mobile Number',
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
                    controller: gender,
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
                      labelText: 'Gender',
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
                                  "Delivery Address",
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
                    controller: address,
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
                      labelText: 'Address',
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
                    controller: street,
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
                      labelText: 'Street',
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
                    controller: landmark,
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
                      labelText: 'Landmark',
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

                        if( _center == null)
                          Fluttertoast.showToast(
                            msg: "Pick A Delivery Address",
                            gravity: ToastGravity.CENTER,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 12.0,
                          );
                        else  if(firstName.text.isEmpty || firstName.text == ""||lastName.text.isEmpty || lastName.text == ""||
                            email.text.isEmpty || email.text == ""||gender.text.isEmpty || gender.text == ""||
                            address.text.isEmpty || address.text == ""||street.text.isEmpty || street.text == ""||
                            landmark.text.isEmpty || landmark.text == ""||pincode.text.isEmpty || pincode.text == "")
                            Fluttertoast.showToast(
                            msg: "Enter All Fields",
                          );
                         else
                          BlocProvider.of<UpdateProfileBloc>(context).add(UpdateProfile(
                            firstName: firstName.text,
                          lastName: lastName.text,
                          email: email.text,
                          gender: gender.text,
                          address: address.text,
                          street: street.text,
                          landmark: landmark.text,
                          pincode: pincode.text,
                          lat:_center!.latitude.toString(),
                          lon:_center!.longitude.toString()
                       ));
                        //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                      },
                      color: new Color(0xffFFCC00),
                       child:new BlocConsumer<UpdateProfileBloc,UpdateProfileState>(builder: (context,state){
                         if (state is UpdatingProfile){
                           return SizedBox(
                             height: 22.0,
                             width: 22.0,
                             child: CircularProgressIndicator(
                               valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                               strokeWidth: 2,
                             ),
                           );
                         }
                         else if (state is UpdateError) {
                           _showToast(state.error);
                           return new Text(
                             "Submit",
                             style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.w600,
                                 fontSize: 15,
                                 fontFamily: 'RobotoM'),
                           );
                         } else if (state is UpdateSuccess) {

                           SchedulerBinding.instance!.addPostFrameCallback((_) {
                             Navigator.push(context, MaterialPageRoute(
                                 builder: (context) => HomePage()));
                           });
                         }
                        return new Text(
                           "Submit",
                           style: TextStyle(
                               color: Colors.black,
                               fontWeight: FontWeight.w600,
                               fontSize: 15,
                               fontFamily: 'RobotoM'),
                         );


                       }, listener: (context,state){})

                    ),
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
      infoWindow: InfoWindow(

          ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    _onCameraMove(
      CameraPosition(target: _center!, zoom: 11),
    );
    setState(() {});
  }



  /// Get from gallery
  _getFromGallery() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    // ignore: deprecated_member_use
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }
  void _showToast(String mssg) {
    Fluttertoast.showToast(
      msg: mssg,
      gravity: ToastGravity.CENTER,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 12.0,
    );
  }
}
