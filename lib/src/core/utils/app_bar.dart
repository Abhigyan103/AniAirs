import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      title: const Text("Animu"),
      pinned: true,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      flexibleSpace: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: FlexibleSpaceBar(
            stretchModes: const [StretchMode.fadeTitle],
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.black,
                  Color.fromARGB(187, 0, 0, 0),
                  Colors.transparent
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
