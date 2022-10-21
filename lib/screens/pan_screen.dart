import 'package:flutter/material.dart';

class PanScreen extends StatefulWidget {
  const PanScreen({Key? key}) : super(key: key);

  @override
  State<PanScreen> createState() => _PanScreenState();
}

class _PanScreenState extends State<PanScreen> {
  bool isAlpha = true;
  double posX = 0;
  double posY = 0;
  double imgCon = 21; // image constant for size & placement

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pan'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isAlpha = !isAlpha;
                posX = 0;
                posY = 0;
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: isAlpha
          // Full screen follow
          ? Stack(
              children: [
                // Padding won't work. Will need to set and track bounds.
                Positioned(
                  left: posX == 0
                      ? MediaQuery.of(context).size.width / 2 - imgCon
                      : posX - imgCon,
                  top: posY == 0
                      ? MediaQuery.of(context).size.height / 2 - 110
                      : posY - imgCon,
                  child: Icon(
                    Icons.play_arrow,
                    size: imgCon * 2,
                  ),
                ),
                Center(
                  child: SizedBox(
                    child: GestureDetector(
                      onPanStart: (DragStartDetails details) {
                        print('Start');
                        print(details);
                        setState(() {
                          posX = details.localPosition.dx;
                          posY = details.localPosition.dy;
                        });
                      },
                      onPanUpdate: (DragUpdateDetails details) {
                        print('Update');
                        print(details);
                        setState(() {
                          posX = details.localPosition.dx;
                          posY = details.localPosition.dy;
                        });
                      },
                      onPanEnd: (DragEndDetails details) {
                        print('End');
                        print(details);
                      },
                      onPanCancel: () {
                        print('Cancel?');
                      },
                      onPanDown: (DragDownDetails details) {
                        print('Down');
                        print(details);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          // color: Colors.red,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          // 2/3 dueling mirror
          : Stack(
              children: [
                Positioned(
                  bottom: posY == 0
                      ? MediaQuery.of(context).size.height / 4
                      : posY - imgCon,
                  right: posX == 0
                      ? MediaQuery.of(context).size.width / 2 - 21
                      : posX - imgCon / 2,
                  child: Icon(
                    Icons.play_arrow,
                    size: imgCon * 2,
                  ),

                  // left: posX == 0
                  //     ? MediaQuery.of(context).size.width / 2 - imgCon
                  //     : posX - imgCon,
                  // top: posY == 0
                  //     ? MediaQuery.of(context).size.height / 2
                  //     : posY - imgCon,
                  // child: Icon(
                  //   Icons.play_arrow,
                  //   size: imgCon * 2,
                  // ),
                ),
                Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.green,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        child: GestureDetector(
                          onPanStart: (DragStartDetails details) {
                            print('Start');
                            print(details);
                            setState(() {
                              posX = details.localPosition.dx;
                              posY = details.localPosition.dy;
                            });
                          },
                          onPanUpdate: (DragUpdateDetails details) {
                            print('Update');
                            print(details);
                            setState(() {
                              posX = details.localPosition.dx;
                              posY = details.localPosition.dy;
                            });
                          },
                          onPanEnd: (DragEndDetails details) {
                            print('End');
                            print(details);
                          },
                          onPanCancel: () {
                            print('Cancel?');
                          },
                          onPanDown: (DragDownDetails details) {
                            print('Down');
                            print(details);
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              // color: Colors.red,
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}
