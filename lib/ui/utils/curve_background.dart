import 'package:flutter/material.dart';

class CurveBackground extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0.0, size.height);

    var controlPoint = Offset(size.width / 4, size.height * .8);
    var endpoint = Offset(size.width / 2, size.height * .9);

    path.quadraticBezierTo(controlPoint.dx, controlPoint.dy, endpoint.dx, endpoint.dy);

    var controlPoint2 = Offset(size.width * 3 / 4, size.height);
    var endpoint2 = Offset(size.width, size.height * .65);

    path.quadraticBezierTo(controlPoint2.dx, controlPoint2.dy, endpoint2.dx, endpoint2.dy);

    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
