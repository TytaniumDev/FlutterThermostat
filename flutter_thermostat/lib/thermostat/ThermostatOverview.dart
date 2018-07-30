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
          return ListTile(
            title: Text(
              'Remote Temperature Sensors go here!',
              style: Theme.of(context).primaryTextTheme.body2,
            ),
            subtitle: Text(
              'Insights go here',
              style: Theme.of(context).accentTextTheme.body1,
            ),
            trailing: Icon(
              Icons.radio_button_unchecked,
              color: Colors.white,
            ),
            onTap: () {
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: 200.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Suck it Native Android',
                              style: TextStyle(fontSize: 24.0)),
                          Text('(and iOS)',
                              style: TextStyle(fontSize: 18.0)),
                        ],
                      ),
                    );
                  });
            },
          );
        }
      }),
    );
  }
}
