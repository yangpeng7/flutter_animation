import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedPhysicalModelDemo extends StatefulWidget {
  @override
  _AnimatedPhysicalModelDemoState createState() =>
      _AnimatedPhysicalModelDemoState();
}

class _AnimatedPhysicalModelDemoState extends State<AnimatedPhysicalModelDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPhysicalModel"),
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
              child: AnimatedPhysicalModel(
                curve: _curve,
                borderRadius: selected
                    ? BorderRadius.circular(20)
                    : BorderRadius.circular(40),
                color: Colors.blue,
                shape: BoxShape.rectangle,
                shadowColor: Colors.black,
                duration: const Duration(seconds: 1),
                elevation: selected ? 20 : 5,
                child: Container(
                  height: 200,
                  width: 200,
                ),
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
      child: AnimatedPhysicalModel(
        curve: _curve,
        borderRadius: selected
            ? BorderRadius.circular(20)
            : BorderRadius.circular(40),
        color: Colors.blue,
        shape: BoxShape.rectangle,
        shadowColor: Colors.black,
        duration: Duration(seconds: 1),
        elevation: selected ? 20 : 5,
        child: Container(
          height: 200,
          width: 200,
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
