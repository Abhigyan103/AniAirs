import 'package:aniairs_cal/src/features/top_rated.dart/top_rated.dart';
import 'package:aniairs_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      theme: darkTheme,
      home: const TopRated(),
    );
  }
}
