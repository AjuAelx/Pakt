//
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class MapPick extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<MapPick> {
  Position? _currentPosition;
  Completer<GoogleMapController> _controller = Completer();
  LatLng? _center;
  final Set<Marker> _markers = {};
  MapType _currentMapType = MapType.normal;

  void initState() {
    super.initState();
    intFunc();
  }

  intFunc() async {
    await _getCurrentLocation();
  }

  bool loading = true;
  void _onCameraMove(CameraPosition position) {
    _center = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onAddMarkerButtonPressed(LatLng latlang) {
    _center = latlang;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(" "),
        position: latlang,
        infoWindow: InfoWindow(
        ),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
    print(_center!.longitude);
    print(_center!.latitude);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose delivery location',
              style: TextStyle(fontSize: 16, fontFamily: 'RobotoM')),
          backgroundColor: Colors.black,
        ),
        body: loading
            ? Center(
                child: CupertinoActivityIndicator(),
              )
            : Stack(
                children: <Widget>[
                  GoogleMap(
                    onMapCreated: _onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: _center!,
                      zoom: 11.0,
                    ),
                    mapType: _currentMapType,
                    markers: _markers,
                    onCameraMove: _onCameraMove,
                    onTap: _onAddMarkerButtonPressed,
                  ),
                ],
              ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: MaterialButton(
                  minWidth: MediaQuery.of(context).size.width - 120,
                  height: 45,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(0.0),
                    ),
                  ),
                  onPressed: () async {
                    Map d = {
                      "lat": _center!.latitude,
                      "lon": _center!.longitude,
                    };
                    Navigator.of(context).pop(d);
                    // Navigator.pop(context, MaterialPageRoute(builder: (context) => CompleteProfile(lat:_center!.latitude.toString(),long:_center!.longitude.toString())));
                  },
                  color: new Color(0xffFFCC00),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                        fontFamily: 'RobotoM'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high,
            forceAndroidLocationManager: true)
        .then((Position position) {
      _currentPosition = position;
      _center = LatLng(_currentPosition!.latitude, _currentPosition!.longitude);
      loading = false;
      if (mounted) setState(() {});
    }).catchError((e) {
      print(e);
    });
  }
}
