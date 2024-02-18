import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rampi_dashboard/controller/controllers.dart';
import 'package:rampi_dashboard/controller/markers.dart';
import 'package:rampi_dashboard/firebase_options.dart';
import 'package:rampi_dashboard/view/main_view.dart';
import 'package:rampi_dashboard/globals.dart' as globals;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Controller c = Get.put(Controller());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
      .then((value) {
    globals.userPos = CameraPosition(
      target: LatLng(value.latitude, value.longitude),
      zoom: 14.4746,
    );
  });
  await createMarkers();
  runApp(const GetMaterialApp(home: MyHomePage(title: 'Dashboard')));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rampi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Dashboard'),
    );
  }
}
