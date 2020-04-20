// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'components/Itemscard.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var mapToggle = false;
  Position currlocation;
  String currAddress;

  Map<String,Marker> clients = {}; 
  
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  _getlocation() async {
    geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      locationPermissionLevel: GeolocationPermission.location
    ).then((Position location){
      setState(() {
        currlocation = location;
        mapToggle = true;
      });
    }).catchError((e){
      print(e);
    });

    setState(() {
      clients.clear();
      final marker = Marker(
        markerId: MarkerId('curr_loc'),
        position: LatLng(currlocation.latitude, currlocation.longitude),
        infoWindow: InfoWindow(title: 'Your location')
        );
      clients['Current location'] = marker;
    });
  } 

  void initState(){
    super.initState();
    _getlocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.lightBlue[50].withOpacity(0.2),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 300.0,
                  child: (mapToggle) ? 
                  GoogleMap(
                    mapType: MapType.terrain,
                    zoomGesturesEnabled: false,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(currlocation.latitude, currlocation.longitude),
                      zoom: 14.5,
                    ),
                    markers: clients.values.toSet(),
                  ): 
                  Center(
                    child: CircularProgressIndicator()
                  ) 
                ),
                Positioned(
                    top: 258.0,
                    right: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.blue.withOpacity(0.7)
                        ),
                      padding: EdgeInsets.all(10.0),
                      child: Text('$currlocation'),
                      )
                    )
              ],
            ),
            Container(color:Colors.black,height: 3.0,),
            SizedBox(height: 8.0,),
            Container(
              child: Column(
                children: <Widget>[
                  Items(icon: Icon(Icons.local_hospital,color: Colors.brown,),
                  name: 'Hospitals',),
                  Items(icon: Icon(Icons.local_pharmacy,color: Colors.brown),
                  name: 'Medical Stores',),
                  Items(icon: Icon(Icons.local_grocery_store,color: Colors.brown),
                  name: 'Grocery Stores',),
                  Items(icon: Icon(Icons.local_convenience_store,color: Colors.brown),
                   name: 'Convenience Stores',),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
