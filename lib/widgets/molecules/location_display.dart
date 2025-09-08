import 'package:flutter/material.dart';
import 'package:anatomic/widgets/atoms/weather_text.dart';

class LocationDisplay extends StatelessWidget {
  final String city;

  const LocationDisplay({Key? key, required this.city}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeatherText(
      text: city,
      fontSize: 30,
      fontWeight: FontWeight.bold,
      isPrimary: true,
    );
  }
}
