import 'package:flutter/material.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String buttonText;
  final TextStyle? textStyle;
  const CustomButton({
    Key? key,
    required this.buttonText,
    required this.onTap,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(25.0)),
      child: Container(
        decoration: const BoxDecoration(
          color: blue,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Text(
            buttonText,
            style: textStyle ?? size16weight300,
          ),
        ),
      ),
    );
  }
}
