import 'package:flutter/material.dart';

import '../../../utilities/constants/theme_globals.dart';

class CustomAppBar extends PreferredSize {
  final Widget barChild;
  final double height;
  final EdgeInsetsGeometry? padding;

  CustomAppBar({
    Key? key,
    required this.barChild,
    this.height = 90,
    this.padding,
  }) : super(
          key: key,
          preferredSize: Size.fromHeight(height),
          child: barChild,
        );

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      alignment: Alignment.center,
      color: black900,
      child: barChild,
      padding: padding,
    );
  }
}
