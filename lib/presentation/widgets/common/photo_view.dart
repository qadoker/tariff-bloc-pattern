import 'package:flutter/material.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class PhotoView extends StatelessWidget {
  final String assetName;
  final bool isCircle;
  final double width;
  final double height;
  final Color borderColor;
  final double photoScale;

  const PhotoView({
    Key? key,
    required this.assetName,
    this.isCircle = false,
    this.height = 110,
    this.width = 110,
    this.borderColor = whiteColor,
    this.photoScale = 0.8,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: borderColor,
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
        image: DecorationImage(
          scale: isCircle ? photoScale : 1,
          fit: BoxFit.cover,
          image: AssetImage(assetName),
        ),
      ),
    );
  }
}
