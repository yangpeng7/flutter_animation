import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedPositionedDemo extends StatefulWidget {
  @override
  _AnimatedPositionedDemoState createState() => _AnimatedPositionedDemoState();
}

class _AnimatedPositionedDemoState extends State<AnimatedPositionedDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPositioned"),
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
            Container(
              width: 200,
              height: 350,
              child: Stack(
                children: [
                  AnimatedPositioned(
                    width: selected ? 200.0 : 50.0,
                    height: selected ? 50.0 : 200.0,
                    top: selected ? 50.0 : 150.0,
                    duration: const Duration(seconds: 1),
                    curve: _curve,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selected = !selected;
                        });
                      },
                      child: Container(
                        color: Colors.blue,
                        child: Center(child: Text('Tap me')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    Container(
      width: 200,
      height: 350,
      child: Stack(
        children: [
          AnimatedPositioned(
            width: selected ? 200.0 : 50.0,
            height: selected ? 50.0 : 200.0,
            top: selected ? 50.0 : 150.0,
            duration: Duration(seconds: 1),
            curve: _curve,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: Container(
                color: Colors.blue,
                child: Center(child: Text('Tap me')),
              ),
            ),
          ),
        ],
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
