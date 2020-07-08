import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DragObj extends StatefulWidget {
  final List imag;
  final Offset position;

  DragObj({this.imag,this.position});


  @override
  _DragObj createState() => _DragObj();
}
class _DragObj extends State<DragObj>{
  Offset pos;
  @override
  void initState() {
    pos = widget.position;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: pos.dy,
        left: pos.dx,
        child: Draggable(
            child: Container(
              child: Row(
                children: <Widget>[
                  new SizedBox(
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Image.asset(widget.imag[index]);
                      },
                      itemCount: widget.imag.length,
                      itemWidth: 200,
                      itemHeight: 200,
                      control: new SwiperControl(),
                      layout: SwiperLayout.DEFAULT,
                      customLayoutOption: CustomLayoutOption(
                          startIndex: -1, stateCount: 3)
                          .addRotate([0 / 180, 0.0, 0 / 180]).addTranslate([
                        Offset(-400.0, 0.0),
                        Offset(0.0, 0.0),
                        Offset(370, -40.0),
                      ]),
                    ),
                    height: 90,
                    width: 250,
                  ),
                ],
              ),
            ),
            feedback: Opacity(
              opacity: 0.5,
              child: Container(
                child: Row(
                  children: <Widget>[
                    new SizedBox(
                      child: Swiper(
                        itemBuilder: (BuildContext context, int index) {
                          return Image.asset(widget.imag[index]);
                        },
                        itemCount: widget.imag.length,
                      ),
                      height: 90,
                      width: 250,
                    ),
                  ],
                ),
              )
            ),
          onDraggableCanceled: (view, offset){
              setState(() {
                pos=offset;
              });
          },
        ),
    );
  }
}