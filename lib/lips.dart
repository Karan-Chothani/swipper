import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class LipsOutline extends StatefulWidget {
  @override
  _LipsOutlineState createState() => _LipsOutlineState();
}

class _LipsOutlineState extends State<LipsOutline> {
  var lImage = [
    "img/lips/1.png",
    "img/lips/2.png",
    "img/lips/3.png",
    "img/lips/4.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return new Image.asset(lImage[index]);
        },
        itemCount: lImage.length,
        itemWidth: 130,
        itemHeight: 150,
        control: new SwiperControl(),
        viewportFraction: 0.7,
        layout: SwiperLayout.CUSTOM,
        customLayoutOption:
            CustomLayoutOption(startIndex: 0, stateCount: 3)
                .addRotate([0 / 180, 0.0, 0 / 180]).addTranslate([
          Offset(-400.0, 0.0),
          Offset(0.0, 0.0),
          Offset(370, -40.0),
        ]),
      ),
    );
  }
}