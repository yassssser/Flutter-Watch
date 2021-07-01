import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stopwatch_flutter/ui/clock_hand.dart';
import 'package:stopwatch_flutter/ui/clock_markers.dart';

import 'elapsed_time_text.dart';

class StopWatchRenderer extends StatelessWidget {
  StopWatchRenderer({Key key, @required this.elapsed, @required this.radius})
      : super(key: key);

  final Duration elapsed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var i = 0; i < 60; i++)
          Positioned(
            left: radius,
            top: radius,
            child: ClockSecondsTickMarker(seconds: i, radius: radius),
          ),
        for (var i = 5; i <= 60; i += 5)
          Positioned(
            left: radius,
            top: radius,
            child: ClockTextMarker(
              value: i,
              radius: radius,
              maxValue: 60,
            ),
          ),
        Container(
          decoration: BoxDecoration(
              // border: Border.all(width: 3, color: Colors.orange),
              borderRadius: BorderRadius.circular(radius)),
        ),
        Positioned(
          left: radius,
          top: radius,
          child: ClockHand(
            handLength: radius,
            handThickness: 2,
            rotationZAngle: pi + (2 * pi / 60000) * elapsed.inMilliseconds,
            color: Colors.orange,
          ),
        ),
        Positioned(
          top: radius * 1.3,
          left: 0,
          right: 0,
          child: ElapsedTimeText(elapsed: elapsed),
        )
      ],
    );
  }
}
