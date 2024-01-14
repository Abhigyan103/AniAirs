import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardGradient extends ConsumerWidget {
  final bool isAiring;
  const CardGradient({super.key, this.isAiring = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Color> colors = [
      Colors.transparent,
      Colors.transparent,
      Colors.transparent,
      const Color(0xD8E9C46A),
      const Color(0xD8E9C46A)
    ];
    // if (!isAiring) {
    //   colors = [
    //     Colors.transparent,
    //     const Color.fromARGB(105, 54, 202, 185),
    //     const Color.fromARGB(231, 54, 202, 185),
    //     const Color.fromARGB(215, 54, 202, 185),
    //   ];
    // }
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );
  }
}
