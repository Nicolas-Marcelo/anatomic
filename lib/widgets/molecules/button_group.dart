import 'package:flutter/material.dart';
import 'package:anatomic/widgets/atoms/custom_button.dart';

class ButtonGroup extends StatelessWidget {
  final VoidCallback onUpdate;
  final VoidCallback onSearch;

  const ButtonGroup({Key? key, required this.onUpdate, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(label: "Atualizar Clima", onPressed: onUpdate, isPrimary: true),
        const SizedBox(height: 10),
        CustomButton(label: "Buscar Nova Cidade", onPressed: onSearch, isPrimary: false),
      ],
    );
  }
}
