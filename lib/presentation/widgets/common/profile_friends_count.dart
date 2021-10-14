import 'package:flutter/material.dart';
import 'package:tarrif/utilities/constants/theme_globals.dart';

class FriendCountWidget extends StatelessWidget {
  final String status;
  final int count;
  final Function() onTap;
  final Color countColor;
  final TextAlign textAlign;
  const FriendCountWidget({
    Key? key,
    required this.status,
    required this.count,
    required this.onTap,
    this.countColor = whiteColor,
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: status,
      child: InkWell(
        onTap: onTap,
        child: RichText(
          textAlign: textAlign,
          text: TextSpan(
            children: [
              TextSpan(
                text: count.toString(),
                style: size18weight700.copyWith(color: countColor),
              ),
              const WidgetSpan(child: SizedBox(height: 5)),
              TextSpan(
                text: "\n$status",
                style: size14weight300,
              )
            ],
          ),
        ),
      ),
    );
  }
}
