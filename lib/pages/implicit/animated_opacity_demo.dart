import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedOpacityDemo extends StatefulWidget {
  @override
  _AnimatedOpacityDemoState createState() => _AnimatedOpacityDemoState();
}

class _AnimatedOpacityDemoState extends State<AnimatedOpacityDemo> {
  double opacityLevel = 1.0;
  Curve _curve = Curves.linear;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedOpacity"),
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
            AnimatedOpacity(
              opacity: opacityLevel,
              duration: const Duration(seconds: 1),
              curve: _curve,
              child: FlutterLogo(
                size: 100,
              ),
            ),
            ElevatedButton(
              child: Text('Fade Logo'),
              onPressed: _changeOpacity,
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
