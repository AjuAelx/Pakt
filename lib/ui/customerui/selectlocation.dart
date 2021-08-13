import 'package:flutter/material.dart';
import 'package:pakt/ui/customerui/homepage.dart';

import 'package:geolocator/geolocator.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({Key? key}) : super(key: key);

  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  Position? _currentPosition;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
       body: SafeArea(
         child: Container(
           height: MediaQuery.of(context).size.height,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Pak’t",style: Theme.of(context).textTheme.headline1,),
                ),
              // SizedBox(height: 50,),
               Center(
                 child: Column(

                   children: [
                     Container(

                         height: MediaQuery.of(context).size.height/1.7,
                         width: 350,
                         child: Image.asset('assets/location.png')),
                     Text("Welcome, Nice to meet you!",style: Theme.of(context).textTheme.headline2,),
                     SizedBox(height: 10,),
                     Text("Set your location to start exploring Restaurants near you."),
                          SizedBox(height: 20,),
                     MaterialButton(
                       minWidth: MediaQuery.of(context).size.width-100,
                       height: 45,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(
                           Radius.circular(7.0),
                         ),
                       ),
                       onPressed: () async {
                         _getCurrentLocation();
                         // await PrefManager.setCurrentLocation(_currentPosition!.latitude+_currentPosition!.longitude);
                         // var loc = await PrefManager.getCurrentLocation();
                         // print(loc);
                      //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoadingScreen()));
                       },
                       color: new Color(0xffFFCC00),


                       child: Text(
                         "Use current Location",
                         style: TextStyle(
                             color: Colors.black,
                             fontWeight: FontWeight.w600,
                             fontSize: 15,fontFamily: 'Roboto'),
                       ),
                     ),
                     SizedBox(height: 25,),
                     InkWell(child: Text("Set your location Manually",style: Theme.of(context).textTheme.headline2),
                       onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                     ),
                     SizedBox(height: 20,),
                     if (_currentPosition != null) Text(
                         "LAT: ${_currentPosition!.latitude}, LNG: ${_currentPosition!.longitude}"
                     ),

                   ],
                 ),
               )
             ],
           ),
         ),
       )

    );
  }

  _getCurrentLocation() {
    Geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best, forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}
