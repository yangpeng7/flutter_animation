import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import 'component/curve_picker.dart';

class AnimatedDefaultTextStyleDemo extends StatefulWidget {
  @override
  _AnimatedDefaultTextStyleDemoState createState() =>
      _AnimatedDefaultTextStyleDemoState();
}

class _AnimatedDefaultTextStyleDemoState
    extends State<AnimatedDefaultTextStyleDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedDefaultTextStyle"),
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
            InkWell(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedDefaultTextStyle(
                curve: _curve,
                duration: Duration(seconds: 1),
                style: selected
                    ? TextStyle(
                        fontSize: 50,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold)
                    : TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.w100),
                child: Text("Hello World"),
              ),
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    bool selected = false;
    
    InkWell(
      onTap: () {
        setState(() {
          selected = !selected;
        });
      },
      child: AnimatedDefaultTextStyle(
        curve: _curve,
        duration: Duration(seconds: 1),
        style: selected
            ? TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold)
            : TextStyle(
                fontSize: 30,
                color: Colors.black,
                fontWeight: FontWeight.w100),
        child: Text("Hello World"),
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
