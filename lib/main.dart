import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_generator/screens/home_screen_mobile.dart';
import 'package:qr_generator/screens/home_screen_web.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: (kIsWeb) ? HomeScreenWeb() : HomeScreenMobile(),
    );
  }
}
