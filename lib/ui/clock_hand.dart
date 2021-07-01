import 'package:flutter/cupertino.dart';

class ClockHand extends StatelessWidget {
  ClockHand(
      {Key key,
      @required this.color,
      @required this.handLength,
      @required this.handThickness,
      @required this.rotationZAngle})
      : super(key: key);

  final double rotationZAngle;
  final double handThickness;
  final double handLength;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.identity()
        ..translate(-handThickness / 2, 0.0, 0.0)
        ..rotateZ(rotationZAngle),
      child: Container(
        height: handLength,
        width: handThickness,
        color: color,
      ),
    );
  }
}
