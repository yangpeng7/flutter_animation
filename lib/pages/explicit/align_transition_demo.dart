import 'package:flutter/material.dart';

class AlignTransitionDemo extends StatefulWidget {
  @override
  _AlignTransitionDemoState createState() => _AlignTransitionDemoState();
}

class _AlignTransitionDemoState extends State<AlignTransitionDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<AlignmentGeometry> _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
    _animation = Tween<AlignmentGeometry>(
            begin: Alignment.topLeft, end: Alignment.bottomRight)
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AlignTransition"),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: Container(
        height: 200,
        width: 200,
        color: Colors.blue,
        child: AlignTransition(
          alignment: _animation,
          child: Container(
            height: 30,
            width: 30,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
