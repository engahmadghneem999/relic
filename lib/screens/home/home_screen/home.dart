import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../widgets/my_appbar/my_appbar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppbar(),
        body: GoogleMap(
          mapType: MapType.terrain,
          initialCameraPosition: _kGooglePlex,
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ));
  }
}

//AIzaSyDGf2lGfA6u7rAWEVA_qbyeFLS-DGtc-6I
