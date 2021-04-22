import 'package:animation/component/curve_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AnimatedCrossFadeDemo extends StatefulWidget {
  @override
  _AnimatedCrossFadeDemoState createState() => _AnimatedCrossFadeDemoState();
}

class _AnimatedCrossFadeDemoState extends State<AnimatedCrossFadeDemo> {
  bool selected = false;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AnimatedCrossFade"),
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
            AnimatedCrossFade(
              firstChild: InkWell(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Text("Tap me"),
                ),
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
              secondChild: InkWell(
                child: Container(
                  width: 200,
                  height: 200,
                  color: Colors.amber,
                  alignment: Alignment.center,
                  child: Text("Tap me"),
                ),
                onTap: () {
                  setState(() {
                    selected = !selected;
                  });
                },
              ),
              firstCurve: _curve,
              secondCurve: _curve,
              duration:const  Duration(seconds: 1),
              crossFadeState: selected
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
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
