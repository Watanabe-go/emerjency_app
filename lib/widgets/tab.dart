import 'package:emergency_app/screen/set_page.dart';
import 'package:flutter/material.dart';

class TabSet extends StatelessWidget {
  final maxwidth;
  final maxheight;
  final IconData iconPath;
  final String text_set;
  const TabSet({
    super.key,
    required this.maxwidth,
    required this.maxheight,
    required this.iconPath,
    required this.text_set,
    });
  @override
  Widget build(BuildContext context) {
    return  Container(
                  height: maxheight * 0.07,
                  width: maxwidth * 0.9,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        iconPath,
                        size: 40,
                        color: Colors.blue,
                      ),
                      Text(
                        text_set,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ));
  }
}