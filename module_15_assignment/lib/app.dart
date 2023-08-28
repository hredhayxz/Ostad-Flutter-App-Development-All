import 'package:flutter/material.dart';
import 'package:module_15_assignment/ui/screens/map_screen.dart';

class LocationTrackingApp extends StatelessWidget {
  const LocationTrackingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Location Tracking App',
      home: MapScreen(),
    );
  }
}
