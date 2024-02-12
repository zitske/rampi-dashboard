import 'dart:async';
import 'package:rampi_dashboard/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rampi_dashboard/controller/markers.dart';
import 'package:rampi_dashboard/view/widgets/pin_card.dart';
import 'package:rampi_dashboard/view/widgets/ramp_counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _mapStyle = "";
  bool loaded = false;
  bool clicked = false;

  @override
  void initState() {
    super.initState();
    rootBundle.loadString('assets/map_style.txt').then((string) {
      _mapStyle = string;
    });
  }

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text(widget.title)],
          ),
        ),
        body: Stack(children: [
          GoogleMap(
            onTap: (value) {
              globals.selected = false;
              setState(() {});
            },
            mapType: MapType.terrain,
            initialCameraPosition: globals.userPos,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              controller.setMapStyle(_mapStyle);
            },
            markers: globals.Markers.toSet(),
          ),
          const RampCounter(),
          PinCard()
        ]));
  }
}
