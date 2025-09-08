import 'package:flutter/material.dart';

class WeatherText extends StatelessWidget {
  final String text;
  final double fontSize;
  final bool isPrimary; 
  final FontWeight fontWeight;

  const WeatherText({
    Key? key,
    required this.text,
    this.fontSize = 20,
    this.isPrimary = true, 
    this.fontWeight = FontWeight.normal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: isPrimary ? Colors.black : Colors.white,
        fontWeight: fontWeight,
      ),
      textAlign: TextAlign.center,
    );
  }
}
