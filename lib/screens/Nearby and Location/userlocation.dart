import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../mainDrawer.dart';

class LocationMap extends StatefulWidget {
  @override
  _LocationMapState createState() => _LocationMapState();
}

class _LocationMapState extends State<LocationMap> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Map<String,Marker> _markers = {};
  // bool mapToggle=false;
  Position _currposition;
  String _currAddress;
  double lat = 28.6820,long = 77.0676;

  _getlocation() async{
    print("################################################################");

    Position p =  await Geolocator().getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      locationPermissionLevel: GeolocationPermission.location
    );

print("@@@@@@@@ POSITION : $p @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

    geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
      locationPermissionLevel: GeolocationPermission.location
    ).then((Position position){
      print("##Position ### : $position");
      setState(() {
        _currposition = position;
        // mapToggle = true;
      });

      _getaddfromlatlong();
    }).catchError((e){
      
      print(e);
      
    });

    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    
    setState(() {
      _markers.clear();
      final marker = Marker(
        markerId: MarkerId('curr_loc'),
        position: LatLng(_currposition.latitude,_currposition.longitude),
        infoWindow: InfoWindow(title: 'Your Location'),
      );
      _markers['Current Location'] = marker; 
    });
  }

  _getaddfromlatlong() async {
    try{
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
        _currposition.latitude, _currposition.longitude);

      Placemark place = p[0];
      setState(() {
        _currAddress = "${place.subLocality}, ${place.locality}, ${place.country}";
      });
    }
    catch(e){
      print(e);
    }
  }

  void initState(){
    super.initState();
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    print("INIT");
    print("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
    _getlocation(); 
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: MainDrawer(),
        key: _scaffoldkey,
        floatingActionButton: Stack(
              children: <Widget>[
                Positioned(
                    top: 18.0,
                    left: 18.0,
                    child: FloatingActionButton(
                      backgroundColor: Colors.lightBlue[100],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        bottomLeft: Radius.zero,
                        bottomRight: Radius.circular(25.0),
                        topLeft: Radius.zero,
                        topRight: Radius.circular(25.0),
                      )),
                      child: Icon(
                        Icons.dehaze,
                        color: Colors.black,
                      ),
                      onPressed: () => _scaffoldkey.currentState.openDrawer(),
                    )),
              ],
            ),
        body: Container(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Container(
                    height: 300.0,
                    child: 
                    GoogleMap(
                      mapType: MapType.terrain,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, long),
                        zoom: 14,
                      ),
                      // myLocationEnabled: true,
                      zoomGesturesEnabled: false,
                      markers: _markers.values.toSet(),
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
                      child: Text('$_currAddress'),
                  )
                    )
                ],
              ),
              Container(
                height: 5.0,
                color: Colors.brown,
              ),
              Container(
                color: Colors.lightBlue[50],
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ListTile(
                      // contentPadding: EdgeInsets.all(10.0),
                      leading: Icon(Icons.local_hospital),
                      onTap: () => MapsLauncher.launchQuery('Aiims hospital, Asari nagar East,gautam nagar,New Delhi, delhi 110029'),
                      title: Text('Hospitals'),
                      ),
                    Divider(),
                    ListTile(
                      // contentPadding: EdgeInsets.all(10.0),
                      leading: Icon(Icons.healing),
                      onTap: () => MapsLauncher.launchQuery('g-5,gautam nagar rd,gautam nagar,south extension 1,New Delhi ,Delhi 110049'),
                      title: Text('Medical Stores'),
                      ),
                    Divider(),
                    ListTile(
                      // contentPadding: EdgeInsets.all(10.0),
                      leading: Icon(Icons.local_grocery_store),
                      onTap: () => MapsLauncher.launchQuery('Reliance Fresh, Nangloi, Najafgarh Road,Delhi 110041'),
                      title: Text('Grocery'),
                      ),
                    // Divider(),
                    // ListTile(
                    //   // contentPadding: EdgeInsets.all(10.0),
                    //   leading: Icon(Icons.local_convenience_store),
                    //   onTap: () => MapsLauncher.launchQuery('New Delhi'),
                    //   title: Text('Convenience Store'),
                    //   ),
                  ],
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}