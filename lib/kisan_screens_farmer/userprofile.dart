import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kisan_dost_app/kisan_screens_farmer/makepaymentfarmer.dart';

class ProfileUI2 extends StatefulWidget {
  @override
  _ProfileUI2State createState() => _ProfileUI2State();
}

class _ProfileUI2State extends State<ProfileUI2>
    with SingleTickerProviderStateMixin {
  late GoogleMapController mapController;
  Set<Marker> _marker = HashSet<Marker>();
  late LatLng currentPostion;
  final Geolocator _geolocator = Geolocator();

  // LatLng _center =const LatLng(28.5355, 77.3910);
  bool booleanValue = false;
  late LatLng _center;

  late Position currentLocation;
  String address = "Banglore";
  late AnimationController _animationController;

  // late Future<LatLng> _center;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController!.repeat(reverse: true);

    getUserLocation();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<String> _getLocationAddress(double latitude, double longitude) async {
    List<Placemark> newPlace =
        await placemarkFromCoordinates(latitude, longitude);
    Placemark placeMark = newPlace[0];
    String? name = placeMark.name;
    // String subLocality = placeMark.subLocality;
    String? locality = placeMark.locality;
    String? administrativeArea = placeMark.administrativeArea;
    // String subAdministrativeArea = placeMark.administrativeArea;
    String? postalCode = placeMark.postalCode;
    String? country = placeMark.country;
    // String subThoroughfare = placeMark.subThoroughfare;
    String? thoroughfare = placeMark.thoroughfare;
    //_isoCountryCode = placeMark.isoCountryCode;
//return " $name, $thoroughfare, $locality, $administrativeArea, $postalCode, $country";
    return "$locality, $administrativeArea,$country";
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      _center = LatLng(currentLocation.latitude, currentLocation.longitude);
      _marker.add(Marker(
          markerId: MarkerId("0"),
          position: _center,
          infoWindow: InfoWindow(
            title: "Banglore",
          )));
      booleanValue = true;
      _getLocationAddress(_center.latitude, _center.longitude).then((value) {
        setState(() {
          address = value;
        });
      });
    });
    print('center $_center');
  }

  void _ModelBottomSheet() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25.0))),
        // backgroundColor: Colors.black,
        // context: context,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: new Icon(Icons.location_on_outlined),
                  title: new Text('Current Location'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
                  child: Text(address),
                ),
                ListTile(
                  leading: new Icon(Icons.home),
                  title: TextField(
                    decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                        hintText: 'House/Flat/block'),
                  ),
                ),
                ListTile(
                  leading: new Icon(Icons.near_me_outlined),
                  title: TextField(
                    decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                        hintText: 'Landmark'),
                  ),
                ),
                ListTile(
                  leading: new Icon(Icons.people),
                  title: TextField(
                    decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                        hintText: 'Name'),
                  ),
                ),
                ListTile(
                  leading: new Icon(Icons.phone_android_outlined),
                  title: TextField(
                    decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                        hintText: 'Mobile No'),
                  ),
                ),
                ListTile(
                  leading: new Icon(Icons.email_outlined),
                  title: TextField(
                    decoration: InputDecoration(
                        //  border: OutlineInputBorder(),
                        hintText: 'Email Address'),
                  ),
                ),
                Center(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text("Update Now"),
                    color: Colors.blue,
                    minWidth: MediaQuery.of(context).size.width * 0.8,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  ),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profile"),
        actions: [
          FadeTransition(
            opacity: _animationController,
            child: IconButton(
              icon: Icon(
                Icons.notification_important_outlined,
                color: Colors.red,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  return MakePayment();
                }));
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage("add you image URL here "),
                        fit: BoxFit.cover)),
                child: Container(
                  width: double.infinity,
                  height: 150,
                  child: Container(
                    alignment: Alignment(0.0, 2.5),
                    child: CircleAvatar(
                      backgroundImage:
                          NetworkImage("Add you profile DP image URL here "),
                      radius: 60.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Parmod G",
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                  margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                  elevation: 2.0,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 30),
                      child: Text(
                        "FARMER",
                        style: TextStyle(
                            letterSpacing: 2.0, fontWeight: FontWeight.w300),
                      ))),
              SizedBox(
                height: 10,
              ),
              Text(
                address,
                style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Mobile No: 7042659972",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Email Id: abcd@gmail.com",
                style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.black45,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w300),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text(
                  "Kisan Dost Member Since 1998",
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.brown,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: (booleanValue != false)
                    ? GoogleMap(
                        //  onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 15.0,
                        ),
                        markers: _marker,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                      )
                    : Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ModelBottomSheet,
        child: Center(child: Text("Edit")),
      ),
    );
  }
}
