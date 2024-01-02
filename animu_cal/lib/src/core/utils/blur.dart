import 'dart:ui';

import 'package:flutter/material.dart';

class MyBlur extends StatelessWidget {
  final Widget child;
  final double blur;
  const MyBlur({super.key, required this.child, this.blur = 2});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
      child: child,
    ));
  }
}
