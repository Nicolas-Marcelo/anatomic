import 'package:flutter/material.dart';

class LoadingDots extends StatefulWidget {
  const LoadingDots({Key? key}) : super(key: key);

  @override
  _LoadingDotsState createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<LoadingDots>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..repeat(); 

    _animations = List.generate(3, (i) {
      return Tween(begin: 0.0, end: -10.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            i * 0.2, 
            0.6 + i * 0.2,
            curve: Curves.easeInOut,
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(1, animation.value),
          child: child,
        );
      },
      child: Container(
        width: 12,
        height: 12,
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _animations.map(_buildDot).toList(),
    );
  }
}
