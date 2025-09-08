import 'package:flutter/material.dart';
import 'package:anatomic/widgets/molecules/location_display.dart';
import 'package:anatomic/widgets/molecules/temperature_display.dart';
import 'package:anatomic/widgets/atoms/weather_text.dart';

class WeatherCard extends StatelessWidget {
  final String city;
  final double temperature;
  final String description;
  final String icon;

  const WeatherCard({
    Key? key,
    required this.city,
    required this.temperature,
    required this.description,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LocationDisplay(city: city),
          const SizedBox(height: 10),
          TemperatureDisplay(icon: icon, temperature: temperature),
          const SizedBox(height: 10),
          WeatherText(text: description, fontSize: 20, isPrimary: true),
        ],
      ),
    );
  }
}
