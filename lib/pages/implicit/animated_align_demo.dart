import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedAlignDemo extends StatefulWidget {
  @override
  _AnimatedAlignDemoState createState() => _AnimatedAlignDemoState();
}

class _AnimatedAlignDemoState extends State<AnimatedAlignDemo> {
  Alignment _alignment = Alignment.topLeft;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedAlign"),
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
            AnimatedAlign(
              alignment: _alignment,
              duration: const Duration(seconds: 1),
              curve: _curve,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _alignment = _alignment == Alignment.topLeft
                        ? Alignment.topRight
                        : Alignment.topLeft;
                  });
                },
                child: Container(
                  color: Colors.blue,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    Alignment _alignment = Alignment.topLeft;
    
    AnimatedAlign(
      alignment: _alignment,
      duration: Duration(seconds: 1),
      curve: _curve,
      child: InkWell(
        onTap: () {
          setState(() {
            _alignment = _alignment == Alignment.topLeft
                ? Alignment.topRight
                : Alignment.topLeft;
          });
        },
        child: Container(
          color: Colors.blue,
          margin: const EdgeInsets.all(20),
          width: 200,
          height: 200,
        ),
      ),
    ),
              '''),
            )
          ],
        ),
      ),
    );
  }
}
