import 'dart:async';
import 'package:covid/screens/mainDrawer.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './components/Itemscard.dart';

class LocationTest extends StatefulWidget {
  @override
  _LocationTestState createState() => _LocationTestState();
}

class _LocationTestState extends State<LocationTest>
    with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  AnimationController _animcontroller;
  Animation _animation;
  CurvedAnimation _curve;
  String locationName,locationState;
  Location location = new Location();
  
  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex;
  Set<Marker> _markers = {};

  

  

  Future<dynamic> getCurrentLocation() async {
    LocationData _locationData;
    _locationData = await location.getLocation();
    await _getAddressfromCordinates(
        _locationData.latitude, _locationData.longitude);
    return _locationData;
  }

  _getAddressfromCordinates(double lat, double long) async {
    List<Placemark> placemark =
        await Geolocator().placemarkFromCoordinates(lat, long);

    // print("${placemark.length}:  ${placemark[0].name} : ${placemark[0].country} : ${placemark[0].locality}");
    locationName = placemark[0].subLocality;
    locationState = placemark[0].locality;
  }

  Future<dynamic> checkLocationPermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  void initState() {
    //Checking the permission of the location
    checkLocationPermission();

    ///An animation controller lets you control the
    ///duration of an animation
    ///Here the ticker for vsync provider is provided
    ///by the SingleTickerProviderStateMixin
    _animcontroller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    ///Providing our animation with a curve (Parent here is the controller
    ///above)
    _curve = CurvedAnimation(parent: _animcontroller, curve: Curves.easeIn);

    ///Creating a Tween animation with start and end values for the
    ///opacity and providing it with our animation controller
    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_curve);

    super.initState();
  }

  @override
  void dispose() {
    ///Don't forget to clean up resources when you are done using it
    _animcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      drawer: MainDrawer(),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
                future: getCurrentLocation(),
                builder: (context, snapshot) {
                  _animcontroller.forward();
                  if (snapshot.hasData) {
                    LatLng pinPosition =
                        LatLng(snapshot.data.latitude, snapshot.data.longitude);
                    _kGooglePlex = CameraPosition(
                      target: pinPosition,
                      zoom: 15,
                    );

                    _markers.add(Marker(
                        markerId: MarkerId('<MARKER_ID>'),
                        position: pinPosition,
                        infoWindow: InfoWindow(
                          title: "$locationName",
                        )));

                    return Stack(
                      children: <Widget>[
                        SizedBox(
                          height: 300.0,
                          child: FadeTransition(
                            child: GoogleMap(
                              mapType: MapType.normal,
                              initialCameraPosition: _kGooglePlex,
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                              zoomGesturesEnabled: false,
                              compassEnabled: true,
                              markers: _markers,
                            ),
                            opacity: _animation,
                          ),
                        ),
                        Positioned(
                    top: 258.0,
                    right: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.blue,
                      ),
                      padding: EdgeInsets.all(10.0),
                      child: Text('$locationName, $locationState',style: GoogleFonts.roboto(color:Colors.white),),
                  )
                    )
                      ],
                    );
                  } else {
                    return Container(
                        height: 300.0,
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
            Expanded(
              child: Container(
                color: Colors.lightBlue[50].withOpacity(0.4),
                child: Column(
                  children: <Widget>[
                    Items(
                      icon: Icon(Icons.local_hospital,color: Colors.brown,),
                      name: 'Hospitals',
                      url: 'https://www.google.com/maps/search/nearby+hospitals/@28.7166261,77.1139978,15z/data=!3m1!4b1',
                    ),
                    Items(icon: Icon(Icons.local_pharmacy,color: Colors.brown),
                    name: 'Medical Stores',
                    url: 'https://www.google.com/maps/search/nearby+medical+store/@28.7166272,77.1139978,15z/data=!3m1!4b1',
                    ),
                    Items(icon: Icon(Icons.local_grocery_store,color: Colors.brown),
                    name: 'Grocery Stores',
                    url: 'https://www.google.com/maps/search/nearby+grocery+stores/@28.7166255,77.1139978,15z/data=!3m1!4b1',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
