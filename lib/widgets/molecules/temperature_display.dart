import 'package:flutter/material.dart';
import 'package:anatomic/widgets/atoms/weather_icon.dart';
import 'package:anatomic/widgets/atoms/weather_text.dart';

class TemperatureDisplay extends StatelessWidget {
  final String icon;
  final double temperature;

  const TemperatureDisplay({
    Key? key,
    required this.icon,
    required this.temperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIcon(icon: icon),
        const SizedBox(width: 10),
        WeatherText(
          text: '${temperature.toStringAsFixed(1)}°C',
          fontSize: 60,
          fontWeight: FontWeight.w200,
          isPrimary: true,
        ),
      ],
    );
  }
}
