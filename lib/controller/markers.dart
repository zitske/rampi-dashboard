import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';
import 'package:get/state_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rampi_dashboard/controller/conditions.dart';
import 'package:rampi_dashboard/controller/controllers.dart';
import 'package:rampi_dashboard/model/rampa_class.dart';
import 'package:intl/intl.dart';
import 'package:rampi_dashboard/globals.dart' as globals;

Future<void> createMarkers() async {
  final Controller c = Get.find();
  QuerySnapshot querySnapshot = await FirebaseFirestore.instance
      .collection('rampas')
      .where("approved", isEqualTo: true)
      .get();
  List<Marker> markers = [];
  for (var element in querySnapshot.docs) {
    markers.add(Marker(
        markerId: MarkerId(element.id),
        position: LatLng(element['coordenadas'][0], element['coordenadas'][1]),
        /*infoWindow: InfoWindow(
            title:
                'Inclinação: ${inclinacaoText(element["inclinacao"])} \n Condição: ${conditionText(element["condicao"])}',
            snippet:
                "Lat: ${element['coordenadas'][0]}  Long:${element['coordenadas'][1]}"),*/
        icon: BitmapDescriptor.defaultMarker,
        onTap: () {
          c.id.value = element.id;
          c.selected.value = true;
        }));
  }
  globals.Markers = markers;
}
