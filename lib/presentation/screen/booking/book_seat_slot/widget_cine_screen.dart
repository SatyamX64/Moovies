import 'package:findseat/utils/my_const/my_const.dart';
import 'package:flutter/material.dart';

class WidgetCineScreen extends StatefulWidget {
  @override
  _WidgetCineScreenState createState() => _WidgetCineScreenState();
}

class _WidgetCineScreenState extends State<WidgetCineScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Stack(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 320 / 41,
            child: CustomPaint(
              painter: CurveScreenPainter(),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                'Screen here',
                style: FONT_CONST.REGULAR_GRAY4_12,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CurveScreenPainter extends CustomPainter {
  var strokeWidth = 8.0;
  var offset = 10.0;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = COLOR_CONST.DEFAULT
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;

    var path = Path()
      ..moveTo(offset, size.height - offset)
      ..quadraticBezierTo(size.width / 2, -size.height + offset,
          size.width - offset, size.height - offset);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.green[800]!
      ..style = PaintingStyle.fill;

    var path = Path()
      ..lineTo(size.width, size.height)
      ..moveTo(0, size.height * 0.25)
      ..quadraticBezierTo(
          size.width / 2, size.height / 2, size.width, size.height * 0.25)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
