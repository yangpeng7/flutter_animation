import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/implicit/animated_align_demo.dart';
import 'pages/implicit/animated_container_demo.dart';
import 'pages/implicit/animated_cross_fade_demo.dart';
import 'pages/implicit/animated_default_text_style_demo.dart';
import 'pages/implicit/animated_opacity_demo.dart';
import 'pages/implicit/animated_padding_demo.dart';
import 'pages/implicit/animated_physical_model_demo.dart';
import 'pages/implicit/animated_positioned_demo.dart';
import 'pages/implicit/animated_positioned_directional_demo.dart';
import 'pages/implicit/animated_size_demo.dart';
import 'pages/implicit/animated_switcher_demo.dart';
import 'pages/implicit/animated_theme_demo.dart';
import 'pages/implicit/tween_animation_builder_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter 动画集合'),
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
            TextButton(
              child: Text('TweenAnimationBuilder'),
              onPressed: () => Get.to(TweenAnimationBuilderDemo()),
            ),
            TextButton(
              child: Text('AnimatedAlign'),
              onPressed: () => Get.to(AnimatedAlignDemo()),
            ),
            TextButton(
              child: Text('AnimatedContainer'),
              onPressed: () => Get.to(AnimatedContainerDemo()),
            ),
            TextButton(
              child: Text('AnimatedDefaultTextStyle'),
              onPressed: () => Get.to(AnimatedDefaultTextStyleDemo()),
            ),
            TextButton(
              child: Text('AnimatedOpacity'),
              onPressed: () => Get.to(AnimatedOpacityDemo()),
            ),
            TextButton(
              child: Text('AnimatedPadding'),
              onPressed: () => Get.to(AnimatedPaddingDemo()),
            ),
            TextButton(
              child: Text('AnimatedPhysicalModel'),
              onPressed: () => Get.to(AnimatedPhysicalModelDemo()),
            ),
            TextButton(
              child: Text('AnimatedPositioned'),
              onPressed: () => Get.to(AnimatedPositionedDemo()),
            ),
            TextButton(
              child: Text('AnimatedPositionedDirectional'),
              onPressed: () => Get.to(AnimatedPositionedDirectionalDemo()),
            ),
            TextButton(
              child: Text('AnimatedTheme'),
              onPressed: () => Get.to(AnimatedThemeDemo()),
            ),
            TextButton(
              child: Text('AnimatedCrossFade'),
              onPressed: () => Get.to(AnimatedCrossFadeDemo()),
            ),
            TextButton(
              child: Text('AnimatedSize'),
              onPressed: () => Get.to(AnimatedSizeDemo()),
            ),
            TextButton(
              child: Text('AnimatedSwitcher'),
              onPressed: () => Get.to(AnimatedSwitcherDemo()),
            ),
          ],
        ),
      ),
    );
  }
}
