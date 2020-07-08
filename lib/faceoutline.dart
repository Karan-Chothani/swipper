import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class FaceOutline extends StatefulWidget {
  @override
  _FaceOutlineState createState() => _FaceOutlineState();
}

class _FaceOutlineState extends State<FaceOutline> {
  var fImage = ["img/outline/1.png",
                "img/outline/2.png",
                "img/outline/3.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context, int index){
          return new Image.asset(fImage[index]);
        },
        itemCount: fImage.length,
        itemWidth: 300,
        itemHeight: 500,
        control: new SwiperControl(),
        layout: SwiperLayout.CUSTOM,
        customLayoutOption: CustomLayoutOption(startIndex: -1, stateCount: 3)
            .addRotate([0/180, 0.0, 0/180])
            .addTranslate([
          Offset(-400.0, 0.0),
          Offset(0.0, 0.0),
          Offset(370, -40.0),
        ]),
      ),
    );
  }
}
