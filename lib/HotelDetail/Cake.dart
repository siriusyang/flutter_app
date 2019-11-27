import 'package:flutter/cupertino.dart';
import 'package:flutter_app/HotelDetail/WheelPainter.dart';

class Cake extends StatelessWidget {
  final double width;
  final double height;

  Cake({Key key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: WheelPainter(),
    );
  }
}
