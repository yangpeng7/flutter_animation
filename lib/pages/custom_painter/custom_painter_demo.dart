import 'package:animation/pages/custom_painter/line_painter.dart';
import 'package:flutter/material.dart';

class CustomPainterDemo extends StatefulWidget {
  @override
  _CustomPainterDemoState createState() => _CustomPainterDemoState();
}

class _CustomPainterDemoState extends State<CustomPainterDemo>
    with TickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  double progress = 0;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    animation = Tween<double>(
      begin: 0,
      end: 200,
    ).animate(controller)
      ..addListener(() {
        setState(() {
          progress = animation.value;
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CustomPainter"),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: CustomPaint(
        foregroundPainter: LinePainter(progress),
        child: SizedBox(
          // doesn't have to be a SizedBox - could be the Map image
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
