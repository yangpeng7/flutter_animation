import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class AnimatedPaddingDemo extends StatefulWidget {
  @override
  _AnimatedPaddingDemoState createState() => _AnimatedPaddingDemoState();
}

class _AnimatedPaddingDemoState extends State<AnimatedPaddingDemo> {
  double padding = 20;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedPadding"),
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
                  padding = padding == 20 ? 100 : 20;
                });
              },
              child: AnimatedPadding(
                padding: EdgeInsets.all(padding),
                duration: const Duration(seconds: 1),
                curve: _curve,
                child: Container(
                  color: padding == 20.0 ? Colors.redAccent : Colors.blue,
                  height: 200,
                  width: 200,
                ),
              ),
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    double padding = 20;
    
    InkWell(
      onTap: () {
        setState(() {
          padding = padding == 20 ? 100 : 20;
        });
      },
      child: AnimatedPadding(
        padding: EdgeInsets.all(padding),
        duration: Duration(seconds: 1),
        curve: _curve,
        child: Container(
          color: padding == 20.0 ? Colors.redAccent : Colors.blue,
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
