import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facial Swippper',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Face Swiper'),
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
  final ValueNotifier<Matrix4> notifier1 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier2 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier3 = ValueNotifier(Matrix4.identity());
  final ValueNotifier<Matrix4> notifier4 = ValueNotifier(Matrix4.identity());
  var fImage = [
    "img/outline/1.png",
    "img/outline/2.png",
    "img/outline/3.png",
  ];

  var eImage = [
    "img/eyes/1.png",
    "img/eyes/2.png",
    "img/eyes/3.png",
  ];
  var nImage = [
    "img/nose/1.png",
    "img/nose/2.png",
    "img/nose/3.png",
  ];

  var lImage = [
    "img/lips/1.png",
    "img/lips/2.png",
    "img/lips/3.png",
    "img/lips/4.png",
  ];
  double height = 200;
  int itemNo;
  double eh = 200;
  double ew = 200;
  double nh = 100;
  double nw = 300;
  double lh = 100;
  double lw = 100;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("img/wal.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          child: Container(
            child: Stack(
              children: <Widget>[
                Center(
                  /// Main FACE OUTLINE
                  child: new Column(
                    children: <Widget>[
                      new SizedBox(
                        child: new Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return new Image.asset(fImage[index]);
                          },
                          itemCount: fImage.length,
                          itemWidth: 300,
                          itemHeight: 500,
                          control: new SwiperControl(),
                          layout: SwiperLayout.CUSTOM,
                          customLayoutOption: CustomLayoutOption(
                                  startIndex: -1, stateCount: 3)
                              .addRotate([0 / 180, 0.0, 0 / 180]).addTranslate([
                            Offset(-400.0, 0.0),
                            Offset(0.0, 0.0),
                            Offset(370, -40.0),
                          ]),
                        ),
                        height: 500,
                        width: 600,
                      ),
                    ],
                  ),
                ),

                /// EYES
                new Align(
                  child: MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      itemNo = 1;
                      notifier1.value = m;
                    },
                    shouldRotate: false,
                    // shouldScale: true,
                    // shouldTranslate: false,
                    child: AnimatedBuilder(
                      animation: notifier1,
                      builder: (ctx, child) {
                        return Transform(
                          transform: notifier1.value,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0, -0.6),
                                child: Container(
                                  width: ew,
                                  height: eh,
                                  //color: Colors.purple,
                                  child: new SizedBox(
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.asset(
                                          eImage[index],
                                        );
                                      },
                                      itemCount: eImage.length,
                                      itemWidth: 200,
                                      itemHeight: 200,
                                      control: new SwiperControl(),
                                      layout: SwiperLayout.DEFAULT,
                                      customLayoutOption: CustomLayoutOption(
                                              startIndex: -1, stateCount: 3)
                                          .addRotate([
                                        0 / 180,
                                        0.0,
                                        0 / 180
                                      ]).addTranslate([
                                        Offset(-400.0, 0.0),
                                        Offset(0.0, 0.0),
                                        Offset(370, -40.0),
                                      ]),
                                    ),
                                    height: 200,
                                    width: 350,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// NOSE
                new Align(
                  child: MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier2.value = m;
                      itemNo = 2;
                    },
                    shouldRotate: false,
                    // shouldScale: true,
                    // shouldTranslate: false,
                    child: AnimatedBuilder(
                      animation: notifier2,
                      builder: (ctx, child) {
                        return Transform(
                          transform: notifier2.value,
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0, -0.3),
                                child: Container(
                                  width: nw,
                                  height: nh,
                                  //color: Colors.purple,
                                  child: new SizedBox(
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.asset(nImage[index]);
                                      },
                                      itemCount: nImage.length,
                                      itemWidth: 100,
                                      itemHeight: 100,
                                      control: new SwiperControl(),
                                      layout: SwiperLayout.DEFAULT,
                                      customLayoutOption: CustomLayoutOption(
                                              startIndex: -1, stateCount: 3)
                                          .addRotate([
                                        0 / 180,
                                        0.0,
                                        0 / 180
                                      ]).addTranslate([
                                        Offset(-400.0, 0.0),
                                        Offset(0.0, 0.0),
                                        Offset(370, -40.0),
                                      ]),
                                    ),
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// LIPS
                new Align(
                  child: MatrixGestureDetector(
                    onMatrixUpdate: (m, tm, sm, rm) {
                      notifier3.value = m;
                      itemNo = 3;
                    },
                    shouldRotate: false,
                    // shouldScale: true,
                    // shouldTranslate: false,
                    child: AnimatedBuilder(
                      animation: notifier3,
                      builder: (ctx, child) {
                        return Transform(
                          transform: notifier3.value,
                          child: new Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment(0.0, -0.1),
                                child: Container(
                                  width: lw,
                                  height: lh,
                                  //color: Colors.purple,
                                  child: new SizedBox(
                                    child: Swiper(
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Image.asset(lImage[index]);
                                      },
                                      itemCount: lImage.length,
                                      itemWidth: 500,
                                      itemHeight: 600,
                                      control: new SwiperControl(),
                                      layout: SwiperLayout.DEFAULT,
                                      customLayoutOption: CustomLayoutOption(
                                              startIndex: -1, stateCount: 3)
                                          .addRotate([
                                        0 / 180,
                                        0.0,
                                        0 / 180
                                      ]).addTranslate([
                                        Offset(-400.0, 0.0),
                                        Offset(0.0, 0.0),
                                        Offset(370, -40.0),
                                      ]),
                                    ),
                                    height: 500,
                                    width: 650,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),

                /// BUTTONS
                new Align(
                  child: new SpeedDial(
                    animatedIcon: AnimatedIcons.menu_arrow,
                    animatedIconTheme: IconThemeData(size: 24.0),
                    closeManually: true,
                    marginRight: 21.5,
                    marginBottom: 23.5,
                    curve: Curves.easeIn,
                    overlayColor: Colors.black,
                    overlayOpacity: 0.3,
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.purple,
                    children: [
                      SpeedDialChild(
                          child: Icon(
                            Icons.zoom_in,
                            size: 30,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple,
                          label: "Zoom In",
                          labelStyle: TextStyle(fontSize: 14.5),
                          onTap: () {
                            zoomin();
                            //swipe();
                          }),
                      SpeedDialChild(
                          child: Icon(
                            Icons.zoom_out,
                            size: 30,
                          ),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple,
                          label: "Zoom Out",
                          labelStyle: TextStyle(fontSize: 14.5),
                          onTap: () {
                            zoomout();
                            //swipe();
                          }),
                    ],
                  ),
                ),
                new Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 100, 8),
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        if (itemNo == 1) ...[
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("EYE LEFT");
                            },
                            child: Text("<"),
                          ),
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("EYE RIGHT");
                            },
                            child: Text(">"),
                          ),
                        ] else if (itemNo == 2) ...[
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("NOSE LEFT");
                            },
                            child: Text("<"),
                          ),
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("NOSE RIGHT");
                            },
                            child: Text(">"),
                          ),
                        ] else if (itemNo == 3) ...[
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("LIPS");
                            },
                            child: Text("<"),
                          ),
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("LIPS");
                            },
                            child: Text(">"),
                          ),
                        ] else ...[
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("NULL");
                            },
                            child: Text("<"),
                          ),
                          new RaisedButton(
                            onPressed: () {
                              print(itemNo);
                              print("NULL");
                            },
                            child: Text(">"),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void zoomin() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        eh = eh + 10;
        ew = ew + 10;
        print("EYE");
      } else if (itemNo == 2) {
        print(itemNo);
        nh = nh + 10;
        nw = nw + 10;
        print("NOSE");
        swipe1();
      } else if (itemNo == 3) {
        print(itemNo);
        lh = lh + 10;
        lw = lw + 10;
        print("LIPS");
      } else {
        print("NULL");
      }
    });
  }

  void zoomout() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        eh = eh - 10;
        ew = ew - 10;
        print("EYE");
      } else if (itemNo == 2) {
        print(itemNo);
        nh = nh - 10;
        nw = nw - 10;
        print("NOSE");
        swipe1();
      } else if (itemNo == 3) {
        print(itemNo);
        lh = lh - 10;
        lw = lw - 10;
        print("LiPS");
      } else {
        print("NULL");
      }
    });
  }

  void swipe() {
    setState(() {
      if (itemNo == 1) {
        print(itemNo);
        print("EYE swipe");
      } else if (itemNo == 2) {
        print(itemNo);
        print("NOSE swipe");
        new Row(
          children: <Widget>[
            new RaisedButton(
              onPressed: () {
                print(itemNo);
                print("NOSE LEFT");
              },
              child: Text("<"),
            ),
            new RaisedButton(
              onPressed: () {
                print(itemNo);
                print("NOSE RIGHT");
              },
              child: Text(">"),
            ),
          ],
        );
      } else if (itemNo == 3) {
        print(itemNo);
        print("LIPS swipe");
      } else {
        print("NULL");
      }
    });
  }

  void swipe1() {
    setState(() {
      print("INSIDE SWPER!");
      new Row(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              print(itemNo);
              print("NOSE LEFT");
            },
            child: Text("<"),
          ),
          new RaisedButton(
            onPressed: () {
              print(itemNo);
              print("NOSE RIGHT");
            },
            child: Text(">"),
          ),
        ],
      );
    });
  }
}
