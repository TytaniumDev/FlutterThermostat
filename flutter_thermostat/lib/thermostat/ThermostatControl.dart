import 'dart:math';

import 'package:flutter/material.dart';

class ThermostatControl extends StatefulWidget {
  final double minTemp;
  final double maxTemp;
  final int ticks;

  ThermostatControl(
      {this.minTemp = 35.0, this.maxTemp = 90.0, this.ticks = 50});

  @override
  _ThermostatControlState createState() => _ThermostatControlState();
}

class _ThermostatControlState extends State<ThermostatControl> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blueGrey,
                boxShadow: [
                  BoxShadow(
                      color: const Color(0x44000000),
                      blurRadius: 2.0,
                      spreadRadius: 1.0,
                      offset: const Offset(0.0, 1.0))
                ]),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  padding: EdgeInsets.all(0.0),
                  child: CustomPaint(
                    painter: TickPainter(),
                  ),
                ),
                Text(
                  "ECO",
                  style: TextStyle(color: Colors.white, fontSize: 34.0),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
                      child: Icon(
                        Icons.flash_on,
                        color: Colors.white,
                        size: 36.0,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TickPainter extends CustomPainter {
  final inactiveTickPaint = Paint();
  final activeTickPaint = Paint();
  final tickCount = 150;
  final tickLength = 24.0;
  final bottomCutoutSizeMultiplier = 0.20;

  //TODO: Convert temperature to % filled
  //Ticks between the low and high will be filled.
  final lowTemperature = 0.2;
  final highTemperature = .7;

  @override
  void paint(Canvas canvas, Size size) {
    activeTickPaint.color = Colors.white;
    activeTickPaint.strokeWidth = 1.5;

    inactiveTickPaint.color = Colors.grey;
    inactiveTickPaint.strokeWidth = 1.5;

    canvas.translate(size.width / 2, size.height / 2);
    canvas.rotate(-bottomCutoutSizeMultiplier * pi);

    final radius = size.width / 2;
    for (var i = 0; i < tickCount; ++i) {
      canvas.drawLine(
          Offset(0.0, radius),
          Offset(0.0, radius - tickLength),
          i >= tickCount * lowTemperature && i <= tickCount * highTemperature
              ? activeTickPaint
              : inactiveTickPaint);

      canvas.rotate(
          2 * pi - (2 - 2 * bottomCutoutSizeMultiplier) * pi / tickCount);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
