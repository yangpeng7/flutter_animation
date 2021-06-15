import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../component/curve_picker.dart';

class LottieDemo extends StatefulWidget {
  @override
  _LottieDemoState createState() => _LottieDemoState();
}

class _LottieDemoState extends State<LottieDemo> {
  Alignment _alignment = Alignment.topLeft;
  Curve _curve = Curves.linear;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lottie"),
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
            Lottie.asset('assets/64586-like-and-dislike-button.json'),
            Lottie.asset('assets/65014-dog-walking.json'),
            Lottie.asset('assets/65077-breathing-lotus.json'),
          ],
        ),
      ),
    );
  }
}
