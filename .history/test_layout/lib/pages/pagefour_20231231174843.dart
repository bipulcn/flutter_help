import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class PageFour extends StatefulWidget {
  const PageFour({super.key});

  @override
  State<PageFour> createState() => _PageFourState();
}

class _PageFourState extends State<PageFour> {
  var _sides = 3.0;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This is page four")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: const Text(
              "Page Four",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),
          Expanded(
            child: CustomPaint(
              painter: ShapePainter(_sides, 100.0),
              child: Container(),
            ),
          ),
          Slider(
            value: _sides,
            min: 3.0,
            max: 10.0,
            label: _sides.toInt().toString(),
            divisions: 7,
            onChanged: (value) {
              setState(() {
                _sides = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

// FOR PAINTING CIRCLES
class ShapePainter extends CustomPainter {
  final double sides;
  final double radius;
  ShapePainter(this.sides, this.radius);
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.orangeAccent;

    var path = Path();
    var angle = (math.pi * 2) / sides;
    Offset center = Offset(size.width / 2, size.height / 2);
    Offset startPoint =
        Offset(radius * math.cos(0), radius * math.sin(0)); // Offset(dx, dy)

    path.moveTo(startPoint.dx + center.dx, startPoint.dy + center.dy);
    for (int i = 1; i < sides; i++) {
      double x = radius * math.cos(i * angle) + center.dx;
      double y = radius * math.sin(i * angle) + center.dy;
      path.lineTo(x, y);
    }
    path.close();
    canvas.drawPath(path, paint);

    // path.addOval(Rect.fromCircle(
    //   center: Offset(size.width / 2, size.height / 2),
    //   radius: 150,
    // ));
    // canvas.drawLine(Offset.zero, Offset(size.width / 2, size.height), paint);
    // canvas.drawPath(path, paint);
    // path.addOval(Rect.fromCircle(
    //   center: Offset(size.width / 2, size.height / 2),
    //   radius: 100,
    // ));
    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
