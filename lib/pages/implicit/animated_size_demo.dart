import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedSizeDemo extends StatefulWidget {
  @override
  _AnimatedSizeDemoState createState() => _AnimatedSizeDemoState();
}

class _AnimatedSizeDemoState extends State<AnimatedSizeDemo>
    with SingleTickerProviderStateMixin {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedSize"),
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
            AnimatedSize(
              vsync: this,
              curve: _curve,
              duration: const Duration(seconds: 1),
              child: InkWell(
                child: Container(
                  width: selected ? 100 : 200,
                  height: selected ? 100 : 200,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: Text("Tap me"),
                ),
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
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
