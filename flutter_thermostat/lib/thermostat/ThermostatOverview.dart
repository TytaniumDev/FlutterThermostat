import 'package:flutter/material.dart';
import 'package:flutter_thermostat/thermostat/ThermostatControl.dart';

class ThermostatOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text(
          'Upstairs',
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: ListView.builder(itemBuilder: (context, i) {
        if (i == 0) {
          return ThermostatControl();
        }

        if (i < 15) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Remote Temperature Sensors go here',
                  style: Theme.of(context).primaryTextTheme.body1,
                ),
              ),
            ],
          );
          //AAG
        }
      }),
    );
  }
}
