import 'package:flutter/material.dart';
import 'package:anatomic/widgets/organisms/weather_card.dart';
import 'package:anatomic/widgets/organisms/action_section.dart'; 
import 'package:anatomic/widgets/atoms/loading_dots.dart';
import 'package:anatomic/widgets/atoms/weather_text.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key}) : super(key: key);

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _cityName = 'São Paulo';
  double _temperature = 25.0;
  String _weatherDescription = 'Ensolarado';
  String _weatherIcon = '☀️';
  bool _isLoading = false;

  void _fetchWeather() {
    setState(() => _isLoading = true);

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _cityName = 'Rio de Janeiro';
        _temperature = 28.5;
        _weatherDescription = 'Chuva leve';
        _weatherIcon = '🌧️';
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const WeatherText(
          text: "App do Clima",
          fontSize: 22,
          fontWeight: FontWeight.bold,
          isPrimary: false, 
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: AnimatedSwitcher(
          duration: const Duration(seconds: 1), 
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          transitionBuilder: (child, animation) =>
              FadeTransition(opacity: animation, child: child),

          child: _isLoading
              ? const LoadingDots(key: ValueKey('loader'))
              : Column(
                  key: const ValueKey('content'),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 600),
                      switchInCurve: Curves.easeOut,
                      switchOutCurve: Curves.easeIn,
                      transitionBuilder: (child, animation) =>
                          FadeTransition(opacity: animation, child: child),
                      child: WeatherCard(
                        key: ValueKey(
                          '${_cityName}_${_temperature}_${_weatherDescription}_${_weatherIcon}',
                        ),
                        city: _cityName,
                        temperature: _temperature,
                        description: _weatherDescription,
                        icon: _weatherIcon,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ActionsSection(onUpdate: _fetchWeather, onSearch: () {}),
                  ],
                ),
        ),
      ),
    );
  }
}
