import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../component/curve_picker.dart';

class TweenAnimationBuilderDemo extends StatefulWidget {
  @override
  _TweenAnimationBuilderDemoState createState() =>
      _TweenAnimationBuilderDemoState();
}

class _TweenAnimationBuilderDemoState extends State<TweenAnimationBuilderDemo> {
  double targetValue = 100.0;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TweenAnimationBuilder"),
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
            /// 用于Container
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 0, end: targetValue),
              duration: const Duration(seconds: 1),
              curve: _curve,
              builder: (BuildContext context, double size, Widget child) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      targetValue = targetValue == 100.0 ? 200.0 : 100.0;
                    });
                  },
                  child: Container(
                    color: Colors.blue,
                    margin: const EdgeInsets.all(20),
                    width: size,
                    height: size,
                  ),
                );
              },
              child: Icon(Icons.aspect_ratio),
            ),
            Markdown(
              shrinkWrap: true,
              selectable: true,
              data: ('''
    
    double targetValue = 100.0;
              
    TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: targetValue),
      duration: Duration(seconds: 1),
      curve: _curve,
      builder: (BuildContext context, double size, Widget child) {
        return InkWell(
          onTap: () {
            setState(() {
            targetValue = targetValue == 100.0 ? 200.0 : 100.0;
            });
          },
          child: Container(
            color: Colors.blue,
            width: size,
            height: size,
          ),
        );
      },
      child: Icon(Icons.aspect_ratio),
    ),
              '''),
            )
          ],
        ),
      ),
    );
  }
}
