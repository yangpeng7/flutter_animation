import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedSwitcherDemo extends StatefulWidget {
  @override
  _AnimatedSwitcherDemoState createState() => _AnimatedSwitcherDemoState();
}

class _AnimatedSwitcherDemoState extends State<AnimatedSwitcherDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSwitcher"),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CurvePicker(
                        onSelected: (curve) {
                          setState(() {
                            _curve = curve;
                          });
                        },
                      );
                    });
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              switchInCurve: _curve,
              switchOutCurve: _curve,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(child: child, scale: animation);
              },
              child: Text(
                '$_count',
                // This key causes the AnimatedSwitcher to interpret this as a "new"
                // child each time the count changes, so that it will begin its animation
                // when the count changes.
                key: ValueKey<int>(_count),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            ElevatedButton(
              child: const Text('Increment'),
              onPressed: () {
                setState(() {
                  _count += 1;
                });
              },
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    double opacityLevel = 1.0;
    
    AnimatedOpacity(
      opacity: opacityLevel,
      duration: Duration(seconds: 1),
      curve: _curve,
      child: FlutterLogo(
        size: 100,
      ),
    ),
    ElevatedButton(
      child: Text('Fade Logo'),
      onPressed: _changeOpacity,
    ),
              '''),
            )
          ],
        ),
      ),
    );
  }
}
