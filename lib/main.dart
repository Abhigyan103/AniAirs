import 'package:animu_cal/src/views/get_started/get_started.dart';
import 'package:animu_cal/src/views/top_rated.dart/top_rated.dart';
import 'package:animu_cal/theme.dart';
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
      home: const GetStarted(),
    );
  }
}
