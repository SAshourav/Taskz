import 'package:flutter/material.dart';

class TCustomCurvedEdges extends CustomClipper<Path>{

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 20);
    final lastCurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final lineFirstCurve = Offset(0, size.height - 20);
    final lineLastCurve = Offset(size.width-30, size.height-20);
    path.quadraticBezierTo(lineFirstCurve.dx, lineFirstCurve.dy, lineLastCurve.dx, lineLastCurve.dy);

    final EndFirstCurve = Offset(size.width, size.height - 20);
    final EndLastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(EndFirstCurve.dx, EndFirstCurve.dy, EndLastCurve.dx, EndLastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper){
    return true;
  }

}