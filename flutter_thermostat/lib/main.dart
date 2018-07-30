import 'package:flutter/material.dart';
import 'package:flutter_thermostat/thermostat/ThermostatOverview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutterstat',
      theme: ThemeData(
        primaryColor: Colors.black,
      ),
      home: ThermostatOverview(),
    );
  }
}
