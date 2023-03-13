import 'package:flutter/material.dart';

class TextBadge extends StatelessWidget {
  final String text;
  final Color color;
  final double borderRadius;
  final TextStyle textStyle;

  TextBadge({
    required this.text,
    this.color = Colors.red,
    this.borderRadius = 50,
    this.textStyle = const TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
