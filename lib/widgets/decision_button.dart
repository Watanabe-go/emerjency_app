import 'package:flutter/material.dart';

class DecisionButton extends StatelessWidget {
  final maxwidth;
  final maxheight;
  const DecisionButton({
    super.key,
    required this.maxheight,
    required this.maxwidth,
    });

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: maxheight * 0.07,
      width: maxwidth * 0.18,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: FittedBox(
        child: Text(
          '確定',
          style: TextStyle(
              fontSize: 35, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}