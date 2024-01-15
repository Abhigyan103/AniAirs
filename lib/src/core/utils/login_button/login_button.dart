import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LargeButton extends StatelessWidget {
  const LargeButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.label});
  final VoidCallback onPressed;
  final Widget icon, label;
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(onPressed: onPressed, icon: icon, label: label);
  }
}
