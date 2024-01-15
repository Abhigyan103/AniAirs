import 'package:flutter/material.dart';

class NotImplemented extends StatelessWidget {
  const NotImplemented({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'This Page is not yet Implemented',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
