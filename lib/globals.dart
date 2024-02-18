library my_prj.globals;

import 'package:google_maps_flutter/google_maps_flutter.dart';

String id = "";

void setWidget = () {};
List<Marker> Markers = [];
CameraPosition userPos = CameraPosition(
  target: LatLng(37.42796133580664, -122.085749655962),
  zoom: 14.4746,
);
