import 'package:flutter/material.dart';

class WeatherIcon extends StatelessWidget {
  final String icon;
  const WeatherIcon({Key? key, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      icon,
      style: const TextStyle(fontSize: 60),
    );
  }
}
