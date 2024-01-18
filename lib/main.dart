import 'package:AniAirs/src/views/get_started/get_started.dart';
import 'package:AniAirs/src/views/login_signup/login.dart';
import 'package:AniAirs/src/views/main_page/main_page.dart';
import 'package:AniAirs/src/views/top_rated.dart/top_rated.dart';
import 'package:AniAirs/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Future.delayed(Duration(seconds: 3));
  FlutterNativeSplash.remove();
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
