import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedThemeDemo extends StatefulWidget {
  @override
  _AnimatedThemeDemoState createState() => _AnimatedThemeDemoState();
}

class _AnimatedThemeDemoState extends State<AnimatedThemeDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

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
            AnimatedTheme(
              curve: _curve,
              duration: const Duration(seconds: 1),
              data: selected ? ThemeData.light() : ThemeData.dark(),
              child: Card(
                child: InkWell(
                  child: Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: Text("Tap me"),
                  ),
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                ),
              ),
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
