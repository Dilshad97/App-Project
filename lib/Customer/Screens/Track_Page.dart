import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Track extends StatefulWidget {
  const Track({Key? key}) : super(key: key);

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {

  Completer<GoogleMapController> _controller = Completer();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(

            child: GoogleMap(
                initialCameraPosition:CameraPosition(target:LatLng(23.0225,72.5714),zoom: 13 ) ,
                mapType: MapType.normal,
                onMapCreated:(GoogleMapController controller){
                  _controller. complete(controller);

                }

            ) ,
          ),
        ));
  }
}
