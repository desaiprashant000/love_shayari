import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:love_shayari/thirdpage.dart';
import 'package:share_plus/share_plus.dart';

class second extends StatefulWidget {
  int i;
  List j;

  second(this.i, this.j);

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  List c = [
    [
      Color(0xff85FFBD),
      Color(0xffFFFB7D),
      Color(0xff00DBDE),
      Color(0xffF4D03F)
    ],
    [
      Color(0xffFC00FF),
      Color(0xff52ACFF),
      Color(0xff2AF598),
      Color(0xffF4D03F)
    ],
    [
      Color(0xffFFE32C),
      Color(0xffFF2525),
      Color(0xffB721FF),
      Color(0xff16A085)
    ],
    [
      Color(0xff3EECAC),
      Color(0xffFA8BFF),
      Color(0xff2BD2FF),
      Color(0xffF4D03F)
    ],
    [
      Color(0xffF4D03F),
      Color(0xff16A085),
      Color(0xff9FACE6),
      Color(0xff74EBD5)
    ],
    [
      Color(0xffFAD961),
      Color(0xffF76B1C),
      Color(0xffFEE140),
      Color(0xffFA709A)
    ],
  ];
  List<Color> b = [
    Colors.orange,
    Colors.lightBlue,
    Colors.pinkAccent,
    Colors.purpleAccent
  ];

  PageController? p;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    p = PageController(initialPage: widget.i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.zoom_out_map_sharp,
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
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(20),
                  // padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    "${widget.i + 1}/${widget.j.length}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(20),
                    // padding: EdgeInsets.all(20),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.refresh_sharp,
                      size: 30,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      int i = Random().nextInt(b.length);
                      b = c[i];
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              child: PageView.builder(
                onPageChanged: (value) {
                  print(value);
                  setState(() {
                    widget.i = value;
                  });
                },
                controller: p,
                itemCount: widget.j.length,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '💖❤️🧡💛💚💙💜💖\n\n${widget.j[widget.i]}\n\n💖❤️🧡💛💚💙💜💖',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: b,
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            flex: 7,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.copy_outlined,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      FlutterClipboard.copy('${widget.j[widget.i]}')
                          .then((value) {
                        Fluttertoast.showToast(
                            msg: "copy",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      });
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (widget.i > 0) {
                        widget.i--;
                        p!.jumpToPage(widget.i);
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.edit_off,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return third(widget.j[widget.i], "single");
                          },
                        ),
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
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      if (widget.i < widget.j.length - 1) {
                        widget.i++;
                        p!.jumpToPage(widget.i);
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.share,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Share.share('${widget.j[widget.i]}');
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
