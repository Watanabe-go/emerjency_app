import 'package:flutter/material.dart';
import 'package:painter/painter.dart';

import '../models/select_color_model.dart';
import '../widgets/generate_icon.dart';

class MemoScreen extends StatefulWidget {
  static const routeName = '/memo';
  const MemoScreen({super.key});

  @override
  State<MemoScreen> createState() => _MemoScreenState();
}

class _MemoScreenState extends State<MemoScreen> {
  PainterController controller = _newController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  static PainterController _newController() {
    PainterController controller = PainterController();
    controller.thickness = 5.0;
    controller.backgroundColor = Colors.white;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;
    final deviceWidth = MediaQuery.of(context).size.width;

    Widget generateOptionCard(
      String iconPath,
      String text,
      VoidCallback tapFunction,
    ) {
      return SizedBox(
        height: deviceHeight * 0.08,
        width: deviceHeight * 0.08,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          child: InkWell(
            onTap: () => tapFunction(),
            onLongPress: () => tapFunction(),
            child: FittedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GenerateIcon(
                    height: deviceWidth * 0.1,
                    width: deviceWidth * 0.1,
                    background: true,
                    iconPath: iconPath,
                  ),
                  Visibility(
                    visible: text.length > 0,
                    child: FittedBox(
                      child: Text(
                        text,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    )
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 254, 239, 214),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(
                height: deviceHeight * 0.77,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                        width: 3,
                      ),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Painter(controller),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0;
                          i < SelectColorModel.colors.length;
                          i++) ...{
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                controller.drawColor =
                                    SelectColorModel.colors[i];
                              });
                            },
                            onLongPress: () {
                              setState(() {
                                controller.drawColor =
                                    SelectColorModel.colors[i];
                              });
                            },
                            child: Container(
                              height: deviceHeight * 0.1,
                              width: deviceHeight * 0.1,
                              color: SelectColorModel.colors[i],
                              child: Icon(
                                controller.drawColor ==
                                        SelectColorModel.colors[i]
                                    ? Icons.check
                                    : null,
                                color: Colors.white,
                                size: deviceHeight * 0.07,
                              ),
                            ),
                          ),
                        ),
                      }
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: deviceHeight * 0.1,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        generateOptionCard(
                          'assets/images/thin_pen_icon.png',
                          '細い',
                          () {
                            setState(() {
                              controller.thickness = 5;
                            });
                          },
                        ),
                        generateOptionCard(
                          'assets/images/thick_pen_icon.png',
                          '太い',
                          () {
                            setState(() {
                              controller.thickness = 15;
                            });
                          },
                        ),
                        generateOptionCard(
                          'assets/images/back_arrow.png',
                          '戻す',
                          () {
                            if (controller.isEmpty) return;
                            controller.undo();
                          },
                        ),
                        generateOptionCard(
                          'assets/images/clear_icon.png',
                          '全消し',
                          () => controller.clear(),
                        ),
                        generateOptionCard(
                          'assets/images/eraser_icon.png',
                          '消しゴム',
                          () {
                            setState(() {
                              controller.drawColor = Colors.white;
                            });
                            // TextToSpeech.speak('消しゴム');
                          },
                        ),
                        SizedBox(
                          height: deviceHeight * 0.1,
                          width: deviceWidth * 0.4,
                          child: Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                color: Colors.black,
                                width: 1,
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: FittedBox(
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GenerateIcon(
                                        height: deviceWidth * 0.1,
                                        width: deviceWidth * 0.1,
                                        background: false,
                                        iconPath:
                                            'assets/images/home_icon.png',
                                      ),
                                      FittedBox(
                                        child: Text(
                                          'トップ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: deviceWidth * 0.1,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                      const Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
