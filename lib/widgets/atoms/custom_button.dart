import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label; 
  final VoidCallback onPressed; 
  final bool isPrimary; 

  const CustomButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.isPrimary = true, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        backgroundColor: isPrimary ? Colors.lightBlue : Colors.white, 
        foregroundColor: isPrimary ? Colors.white : Colors.lightBlue, 
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        textStyle: const TextStyle(fontSize: 16), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10), 
          side: isPrimary ? BorderSide.none : const BorderSide(color: Colors.lightBlue),
        ),
      ),
      child: Text(label), 
    );
  }
}
