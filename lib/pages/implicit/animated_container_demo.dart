import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedContainer"),
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
              child: AnimatedContainer(
                color: Colors.blue,
                curve: _curve,
                duration: const Duration(seconds: 1),
                width: selected ? 200.0 : 100.0,
                height: selected ? 100.0 : 200.0,
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
      child: AnimatedContainer(
        color: Colors.blue,
        curve: _curve,
        margin: const EdgeInsets.all(20),
        duration: Duration(seconds: 1),
        width: selected ? 200.0 : 100.0,
        height: selected ? 100.0 : 200.0,
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
