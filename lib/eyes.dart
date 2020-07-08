import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class EyesOutline extends StatefulWidget {
  @override
  _EyesOutlineState createState() => _EyesOutlineState();
}

class _EyesOutlineState extends State<EyesOutline> {
  var eImage = ["img/eyes/1.png",
                "img/eyes/2.png",
                "img/eyes/3.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context, int index){
          return new Image.asset(eImage[index]);
        },
        itemCount: eImage.length,
        itemWidth: 200,
        itemHeight: 200,
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
