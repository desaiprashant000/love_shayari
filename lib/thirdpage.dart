import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'dart:ui';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:love_shayari/model.dart';
import 'package:share_plus/share_plus.dart';

class third extends StatefulWidget {
  String s;

  String type;

  third(this.s, this.type);

  @override
  State<third> createState() => _thirdState();
}

class _thirdState extends State<third> {
  List c = [
    [
      Color(0xffEB5353),
      Color(0xffF9D923),
      Color(0xff36AE7C),
      Color(0xff187498)
    ],
    [
      Color(0xffE8F9FD),
      Color(0xff79DAE8),
      Color(0xff0AA1DD),
      Color(0xff2155CD)
    ],
    [
      Color(0xff006E7F),
      Color(0xffF8CB2E),
      Color(0xffEE5007),
      Color(0xffB22727)
    ],
    [
      Color(0xffA85CF9),
      Color(0xff5534A5),
      Color(0xff4B7BE5),
      Color(0xff6FDFDF)
    ],
    [
      Color(0xffE9EFC0),
      Color(0xffB4E197),
      Color(0xff83BD75),
      Color(0xff4E944F)
    ],
    [
      Color(0xffEDE6DB),
      Color(0xff417D7A),
      Color(0xff1D5C63),
      Color(0xff1A3C40)
    ],
  ];
  List<Color> b = [
    Color(0xff006778),
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.purpleAccent
  ];

  List<Color> x = [
    Colors.purpleAccent,
    Colors.pinkAccent,
    Colors.purple,
    Colors.pink,
    Colors.lightBlue,
    Colors.orange,
    Colors.deepPurple,
    Colors.yellow,
    Colors.green,
    Colors.red,
    Colors.redAccent,
    Colors.amberAccent,
    Colors.lightBlueAccent,
    Colors.deepOrange,
    Colors.cyanAccent,
    Colors.greenAccent,
  ];
  Color f = Colors.pink;

  Color y = Colors.yellow;

  double s = 10;

  List fontlist = [
    "family1",
    "family2",
    "family3",
    "family4",
    "family5",
    "family6"
  ];
  String fonts = "family1";

  List emojilist = [
    "😀😁😂🤣😃😄😅",
    "💖💜💙💛🧡❤️",
    "🙀😿🐶🐺🐱🦁🦁🐯",
    "🌼🌷🥀☘🌻🌲🌳"
  ];
  String emoji = "🤣😃😅😄😂😁😀";

  GlobalKey _globalKey = GlobalKey();

  Future<Uint8List> _capturePng() async {
    try {
      print('inside');
      RenderRepaintBoundary boundary = _globalKey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png) as ByteData;
      var pngBytes = byteData.buffer.asUint8List();
      var bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }

    return Future.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: _globalKey,
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(40),
                  alignment: Alignment.center,
                  child: Text(
                    "$emoji \n ${widget.s} \n $emoji",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: s,
                        fontWeight: FontWeight.bold,
                        fontFamily: fonts,
                        color: y),
                  ),
                  decoration: BoxDecoration(
                    color: widget.type == "single" ? f : null,
                    gradient: widget.type == "gradient"
                        ? LinearGradient(colors: b)
                        : null,
                  ),
                ),
              ),
            ),
            flex: 3,
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.symmetric(horizontal: 100),
                    child: Icon(
                      Icons.zoom_out_map,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        builder: (context) {
                          return Container(
                            height: 750,
                            child: GridView.builder(
                              itemCount: c.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      b = c[index];
                                      widget.type = "gradient";
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        gradient:
                                            LinearGradient(colors: c[index])),
                                  ),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                            ),
                          );
                        },
                        context: context,
                        isScrollControlled: true,
                        barrierColor: Colors.black,
                        isDismissible: false,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Icon(
                      Icons.refresh_sharp,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      int i = Random().nextInt(b.length);
                      b = c[i];
                      widget.type = "gradient";
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Background",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                              itemCount: x.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      widget.type = "single";
                                      f = x[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      decoration:
                                          BoxDecoration(color: x[index])),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 8,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                            ),
                          );
                        },
                        context: context,
                        isScrollControlled: true,
                        // isDismissible: false,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Text Color",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        builder: (context) {
                          return Container(
                            height: 150,
                            child: GridView.builder(
                              itemCount: x.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      y = x[index];
                                    });
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      decoration:
                                          BoxDecoration(color: x[index])),
                                );
                              },
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 8,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                              ),
                            ),
                          );
                        },
                        context: context,
                        isScrollControlled: true,
                        // isDismissible: false,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Share",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      model().permissioncheck().then((value) {
                        if (value) {
                          _capturePng().then((value) {
                            print(value);

                            DateTime d = DateTime.now();

                            String imagename =
                                "loveshayari${d.year}${d.month}${d.day}${d.hour}${d.minute}${d.second}.jpg";
                            print(imagename);

                            String imagepath = "${model.folderpath}/$imagename";

                            File file = File(imagepath);

                            file.writeAsBytes(value).then((value) {
                              Share.shareFiles([file.path]);
                            });
                          });
                        }
                      });
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Font",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                      builder: (context) {
                        return Container(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: fontlist.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    fonts = fontlist[index];
                                  });
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  width: 150,
                                  color: Colors.cyan,
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Shayari",
                                    style:
                                        TextStyle(fontFamily: fontlist[index]),
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                      context: context,
                    );
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Emoji",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        builder: (context) {
                          return Container(
                            height: 500,
                            child: ListView.builder(
                              itemCount: emojilist.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    setState(() {
                                      emoji = emojilist[index];
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    margin: EdgeInsets.all(10),
                                    color: Colors.cyan,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "${emojilist[index]}",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        context: context,
                      );
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.red,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "Text Size",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      showModalBottomSheet(
                        builder: (context) {
                          return Container(
                            height: 100,
                            child: StatefulBuilder(
                              builder: (context, setState1) {
                                return Slider(
                                  onChanged: (value) {
                                    print(value);
                                    setState(() {
                                      setState1(() {
                                        s =value;
                                      });
                                    });
                                  },
                                  value: s,
                                  max: 80,
                                  min: 10,
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.grey,
                                  thumbColor: Colors.red,
                                  divisions: 10,
                                );
                              },
                            ),
                          );
                        },
                        context: context,
                      );
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
