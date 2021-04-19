import 'package:animation/tween_animation_builder_demo.dart';
import 'package:flutter/material.dart';

import 'animated_align_demo.dart';
import 'animated_container_demo.dart';
import 'animated_default_text_style_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Text(
                '隐式动画',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            FlatButton(
              child: Text('TweenAnimationBuilderDemo'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return TweenAnimationBuilderDemo();
                  },
                ),
              ),
            ),
            FlatButton(
              child: Text('AnimatedAlign'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AnimatedAlignDemo();
                  },
                ),
              ),
            ),
            FlatButton(
              child: Text('AnimatedContainer'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AnimatedContainerDemo();
                  },
                ),
              ),
            ),
            FlatButton(
              child: Text('AnimatedDefaultTextStyle'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return AnimatedDefaultTextStyleDemo();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
