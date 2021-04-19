import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef OnCurveChanged = void Function(Curve curve);

const Map curvesMap = {
  "linear": Curves.linear,
  "decelerate": Curves.decelerate,
  "fastLinearToSlowEaseIn": Curves.fastLinearToSlowEaseIn,
  "ease": Curves.ease,
  "easeIn": Curves.easeIn,
  "easeInToLinear": Curves.easeInToLinear,
  "easeInSine": Curves.easeInSine,
  "easeInQuad": Curves.easeInQuad,
  "easeInCubic": Curves.easeInCubic,
  "easeInQuart": Curves.easeInQuart,
  "easeInQuint": Curves.easeInQuint,
  "easeInExpo": Curves.easeInExpo,
  "easeInCirc": Curves.easeInCirc,
  "easeInBack": Curves.easeInBack,
  "easeOut": Curves.easeOut,
  "linearToEaseOut": Curves.linearToEaseOut,
  "easeOutSine": Curves.easeOutSine,
  "easeOutQuad": Curves.easeOutQuad,
  "easeOutCubic": Curves.easeOutCubic,
  "easeOutQuart": Curves.easeOutQuart,
  "easeOutQuint": Curves.easeOutQuint,
  "easeOutExpo": Curves.easeOutExpo,
  "easeOutCirc": Curves.easeOutCirc,
  "easeOutBack": Curves.easeOutBack,
  "easeInOut": Curves.easeInOut,
  "easeInOutSine": Curves.easeInOutSine,
  "easeInOutQuad": Curves.easeInOutQuad,
  "easeInOutCubic": Curves.easeInOutCubic,
  "easeInOutQuart": Curves.easeInOutQuart,
  "easeInOutQuint": Curves.easeInOutQuint,
  "easeInOutExpo": Curves.easeInOutExpo,
  "easeInOutCirc": Curves.easeInOutCirc,
  "easeInOutBack": Curves.easeInOutBack,
  "fastOutSlowIn": Curves.fastOutSlowIn,
  "slowMiddle": Curves.slowMiddle,
  "bounceIn": Curves.bounceIn,
  "bounceOut": Curves.bounceOut,
  "bounceInOut": Curves.bounceInOut,
  "elasticIn": Curves.elasticIn,
  "elasticOut": Curves.elasticOut,
  "elasticInOut": Curves.elasticInOut,
};

const List curvesNames = [
  "linear",
  "decelerate",
  "fastLinearToSlowEaseIn",
  "ease",
  "easeIn",
  "easeInToLinear",
  "easeInSine",
  "easeInQuad",
  "easeInCubic",
  "easeInQuart",
  "easeInQuint",
  "easeInExpo",
  "easeInCirc",
  "easeInBack",
  "easeOut",
  "linearToEaseOut",
  "easeOutSine",
  "easeOutQuad",
  "easeOutCubic",
  "easeOutQuart",
  "easeOutQuint",
  "easeOutExpo",
  "easeOutCirc",
  "easeOutBack",
  "easeInOut",
  "easeInOutSine",
  "easeInOutQuad",
  "easeInOutCubic",
  "easeInOutQuart",
  "easeInOutQuint",
  "easeInOutExpo",
  "easeInOutCirc",
  "easeInOutBack",
  "fastOutSlowIn",
  "slowMiddle",
  "bounceIn",
  "bounceOut",
  "bounceInOut",
  "elasticIn",
  "elasticOut",
  "elasticInOut",
];

class CurvePicker extends StatefulWidget {
  final OnCurveChanged onSelected;

  const CurvePicker({
    Key key,
    @required this.onSelected,
  }) : super(key: key);

  @override
  _CurvePickerState createState() => _CurvePickerState();
}

class _CurvePickerState extends State<CurvePicker> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              FlatButton(
                onPressed: () {
                  widget?.onSelected
                      ?.call(curvesMap[curvesNames[_selectedIndex]]);
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ],
          ),
          Container(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoPicker(
                    itemExtent: 44,
                    onSelectedItemChanged: (index) {
                      _selectedIndex = index;
                    },
                    children: curvesMap.entries.map((entry) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          entry.key,
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
