import 'package:flutter/material.dart';

class GenerateIcon extends StatelessWidget {
  final double height;
  final double width;
  final String iconPath;
  final bool background;
  const GenerateIcon({
    super.key,
    required this.height,
    required this.width,
    required this.iconPath,
    required this.background,
  });
  
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Padding(
        padding: background ? const EdgeInsets.all(0) : const EdgeInsets.all(5),
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                iconPath,
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}