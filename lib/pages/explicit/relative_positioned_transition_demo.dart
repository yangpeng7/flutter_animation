import 'package:flutter/material.dart';

class RelativePositionedTransitionDemo extends StatefulWidget {
  @override
  _RelativePositionedTransitionDemoState createState() =>
      _RelativePositionedTransitionDemoState();
}

class _RelativePositionedTransitionDemoState
    extends State<RelativePositionedTransitionDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this)
          ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double smallLogo = 100;
    final double bigLogo = 200;

    return Scaffold(
      appBar: AppBar(
        title: Text("RelativePositionedTransition"),
        actions: [
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final Size biggest = constraints.biggest;
          return Stack(
            children: [
              RelativePositionedTransition(
                size: biggest,
                rect: RectTween(
                  begin: Rect.fromLTWH(0, 0, bigLogo, bigLogo),
                  end: Rect.fromLTWH(biggest.width - smallLogo,
                      biggest.height - smallLogo, smallLogo, smallLogo),
                ).animate(CurvedAnimation(
                  parent: _controller,
                  curve: Curves.elasticInOut,
                )),
                child: Padding(
                    padding: const EdgeInsets.all(8), child: FlutterLogo()),
              ),
            ],
          );
        },
      ),
    );
  }
}
