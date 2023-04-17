import 'package:flutter/material.dart';

class CenteredMessage extends StatelessWidget {
  final String message;
  final IconData? icon;
  final double iconSize;
  final double fontSize;

  const CenteredMessage(
    this.message, {
    this.icon,
    this.iconSize = 64,
    this.fontSize = 64,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Visibility(
            visible: icon != null,
            child: Icon(
              icon,
              size: iconSize,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Text(
              message,
              style: TextStyle(fontSize: fontSize),
            ),
          )
        ],
      ),
    );
  }
}
