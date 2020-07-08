import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class NoseOutline extends StatefulWidget {
  @override
  _NoseOutlineState createState() => _NoseOutlineState();
}

class _NoseOutlineState extends State<NoseOutline> {
  var nImage = ["img/nose/1.png",
                "img/nose/2.png",
                "img/nose/3.png",

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Swiper(
        itemBuilder: (BuildContext context, int index){
          return new Image.asset(nImage[index]);
        },
        itemCount: nImage.length,
        itemWidth: 200,
        itemHeight: 100,
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
