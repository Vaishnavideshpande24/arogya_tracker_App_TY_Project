
//import 'dart:typed_data';
//import 'package:flutter/services.dart';
//import 'package:location/location.dart';
//
//import 'package:flutter/material.dart';
//
//import 'authentications.dart';
//import 'main.dart';
//import 'tasks.dart';
//import 'dart:async';
//import 'package:google_maps_flutter/google_maps_flutter.dart';
//
//class Maps extends StatefulWidget {
//
//  @override
//  _MapsState createState() => _MapsState();
//}
//
//class _MapsState extends State<Maps> {
//
//  StreamSubscription _locationSubscription;
//  Location _locationTracker = Location();
//  Marker marker;
//  Circle circle;
//  GoogleMapController _controller;
//
//  static final CameraPosition initialLocation = CameraPosition(
//    target: LatLng(18.820089, 76.770653),
//    zoom: 14.4746,
//  );
//
//  Future<Uint8List> getMarker() async {
//    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/caricon.png");
//    return byteData.buffer.asUint8List();
//  }
//
//  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
//    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
//    this.setState(() {
//      marker = Marker(
//          markerId: MarkerId("home"),
//          position: latlng,
//          rotation: newLocalData.heading,
//          draggable: false,
//          zIndex: 2,
//          flat: true,
//          anchor: Offset(0.5, 0.5),
//          icon: BitmapDescriptor.fromBytes(imageData));
//      circle = Circle(
//          circleId: CircleId("car"),
//          radius: newLocalData.accuracy,
//          zIndex: 1,
//          strokeColor: Colors.blue,
//          center: latlng,
//          fillColor: Colors.blue.withAlpha(70));
//    });
//  }
//
//  void getCurrentLocation() async {
//    try {
//
//      Uint8List imageData = await getMarker();
//      var location = await _locationTracker.getLocation();
//
//      updateMarkerAndCircle(location, imageData);
//
//      if (_locationSubscription != null) {
//        _locationSubscription.cancel();
//      }
//
//
//      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
//        if (_controller != null) {
//          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
//              bearing: 192.8334901395799,
//              target: LatLng(newLocalData.latitude, newLocalData.longitude),
//              tilt: 0,
//              zoom: 18.00)));
//          updateMarkerAndCircle(newLocalData, imageData);
//        }
//      });
//
//    } on PlatformException catch (e) {
//      if (e.code == 'PERMISSION_DENIED') {
//        debugPrint("Permission Denied");
//      }
//    }
//  }
//
//  @override
//  void dispose() {
//    if (_locationSubscription != null) {
//      _locationSubscription.cancel();
//    }
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        appBar: AppBar(
//        elevation: 10.0,
//        backgroundColor: Colors.white,
//          actions: <Widget>[
//            IconButton(
//              icon: Icon(Icons.exit_to_app,color: Colors.black),
//              onPressed: () =>  {
//              Navigator.push(
//              context,
//              MaterialPageRoute(
//              builder: (context) => TasksPage(),
//              ),
//              ),
//              }),
//
//          ],
//          iconTheme: IconThemeData(color: Colors.black),
//
//        ),
//
//      body: GoogleMap(
//        mapType: MapType.hybrid,
//        initialCameraPosition: initialLocation,
//        markers: Set.of((marker != null) ? [marker] : []),
//        circles: Set.of((circle != null) ? [circle] : []),
//        onMapCreated: (GoogleMapController controller) {
//          _controller = controller;
//        },
//
//      ),
//      floatingActionButton: FloatingActionButton(
//          child: Icon(Icons.location_searching),
//          onPressed: () {
//            getCurrentLocation();
//          }),
//
//
//    );
//  }
//}
import 'dart:async';
import 'dart:typed_data';
import 'file:///C:/Users/vaishnavi/Desktop/arogyatracker/lib/Extra/PostHomePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';




class Maps extends StatefulWidget {


  @override
  _MapsState createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  StreamSubscription _locationSubscription;
  Location _locationTracker = Location();
  Marker marker;
  Circle circle;
  GoogleMapController _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(59.3293, 18.0686),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/caricon.png");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude, newLocalData.longitude);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      Uint8List imageData = await getMarker();
      var location = await _locationTracker.getLocation();

      updateMarkerAndCircle(location, imageData);

      if (_locationSubscription != null) {
        _locationSubscription.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged().listen((newLocalData) {
        if (_controller != null) {
          _controller.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude, newLocalData.longitude),
              tilt: 0,
              zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }

  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.white,
//          leading: ListTile(leading: Icon(Icons.arrow_back_ios,size: 20.0,),
//              onTap: () {
//           Navigator.push(
//           context,
//           MaterialPageRoute(
//                  builder: (context) => PostHomePage(),
//        ),
//        );
//        },
//          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.exit_to_app,color: Colors.black),
              onPressed: () {}
            )
          ],
        ),
        drawer:Drawer(child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            new Container(
                height: 280.0,

                child: new DrawerHeader(

                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: FlatButton(
                        onPressed: () {

                        },
                        child: new Icon(
                          Icons.account_box,
                          color: Colors.white,
                          size: 150.0,
                        ),
                        shape: new CircleBorder(),
                        color: Colors.green[700],
                      ),
                    )
                ),
                color:Colors.green[700]),
            SizedBox(height: 4.0),
            ListTile(
              leading: Icon(Icons.home,color: Colors.white,size: 25.0,),
              title: Text('Home',
                style: TextStyle(
                  fontSize: 18.0,
                ),

              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  //  builder: (context) => TasksPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),

            ListTile(
              leading: Icon(Icons.person,color: Colors.white,size: 25.0,),
              title: Text('Sign In',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Maps(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark,color: Colors.white,size: 25.0,),
              title: Text('My Bookings',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                 //   builder: (context) => Contactus(),
                  ),
                );
              },
            ),

            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.cancel,color: Colors.white,size: 25.0,),
              title: Text('',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.question_answer,color: Colors.white,size: 25.0,),
              title: Text('FAQ',
                style: TextStyle(
                  fontSize: 18.0,
                ),),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   // builder: (context) => UploadPhotoPage(),
                  ),
                );
              },
            ),
            SizedBox(height: 6.0),
            ListTile(
              leading: Icon(Icons.info,color: Colors.white,size: 25.0,),
              title: Text('About',
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                   // builder: (context) => Aboutus(),
                  ),
                );
              },
            ),
          ],
        ),
        ),

        //Maps logic
        body: SafeArea(
          child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: initialLocation,
            markers: Set.of((marker != null) ? [marker] : []),
            circles: Set.of((circle != null) ? [circle] : []),
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },

          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 8.0,2.0, 10.0),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              backgroundColor: Colors.blueAccent,
                child: Icon(Icons.location_searching),
                onPressed: () {
                  getCurrentLocation();
                }),
          ),
        ),
      ),
    );
  }
}