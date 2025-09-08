import 'package:flutter/material.dart';
import 'package:anatomic/widgets/molecules/button_group.dart';

class ActionsSection extends StatelessWidget {
  final VoidCallback onUpdate;
  final VoidCallback onSearch;

  const ActionsSection({Key? key, required this.onUpdate, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonGroup(onUpdate: onUpdate, onSearch: onSearch);
  }
}
