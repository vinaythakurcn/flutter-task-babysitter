import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  final int color;
  final bool softWrap;
  final TextAlign textAlign;
  final double lineHeight;
  final bool underline;

  const AppText({
    Key? key,
    required this.text,
    this.size = 16,
    this.color = 0xFF000000,
    this.softWrap = false,
    this.textAlign = TextAlign.left,
    this.lineHeight = 1.2,
    this.underline = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      softWrap: softWrap,
      textAlign: textAlign,
      style: TextStyle(
        color: Color(color),
        fontSize: size,
        height: lineHeight,
        decoration: underline ? TextDecoration.underline : TextDecoration.none,
      ),
    );
  }
}
