import 'package:AniAirs/src/views/get_started/get_started.dart';
import 'package:AniAirs/src/views/login_signup/login.dart';
import 'package:AniAirs/src/views/main_page/main_page.dart';
import 'package:AniAirs/src/views/top_rated.dart/top_rated.dart';
import 'package:AniAirs/theme.dart';
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
      home: LoginPage(),
    );
  }
}
