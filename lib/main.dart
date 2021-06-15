import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'pages/explicit/align_transition_demo.dart';
import 'pages/explicit/positioned_transition_demo.dart';
import 'pages/explicit/scale_transition_demo.dart';
import 'pages/explicit/size_transition_demo.dart';
import 'pages/explicit/slide_transition_demo.dart';
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
import 'pages/lottie/lottie_demo.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.loli.net/2019/08/11/hE2r4ztxvPVundA.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    bottom: 12.0,
                    left: 16.0,
                    child: Text(
                      "九点下班",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                '个人中心',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.location_on,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '版本升级',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.access_alarms,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              title: Text(
                '切换主题',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.group_work,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                '关于我们',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              leading: Icon(
                Icons.email,
                color: Colors.blue[300],
              ),
              onTap: () {},
            ),
            Divider(),
          ],
        ),
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Text(
                '显式动画',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              child: Text('PositionedTransition'),
              onPressed: () => Get.to(PositionedTransitionDemo()),
            ),
            TextButton(
              child: Text('AlignTransition'),
              onPressed: () => Get.to(AlignTransitionDemo()),
            ),
            TextButton(
              child: Text('SizeTransition'),
              onPressed: () => Get.to(SizeTransitionDemo()),
            ),
            TextButton(
              child: Text('ScaleTransition'),
              onPressed: () => Get.to(ScaleTransitionDemo()),
            ),
            TextButton(
              child: Text('SlideTransition'),
              onPressed: () => Get.to(SlideTransitionDemo()),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Text(
                'Lottie',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              child: Text('Lottie'),
              onPressed: () => Get.to(LottieDemo()),
            ),
          ],
        ),
      ),
    );
  }
}
