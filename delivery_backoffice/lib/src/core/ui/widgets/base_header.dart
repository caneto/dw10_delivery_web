import 'package:flutter/material.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String>? searchChange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButton;
  final Widget? filterWidget;

  const BaseHeader({
    super.key,
    required this.title,
    this.searchChange,
    required this.buttonLabel,
    this.buttonPressed,
    required this.addButton,
    this.filterWidget,
  });

  @override
  Widget build(BuildContext context) {
    return const Text('Base Header');
  }
}
