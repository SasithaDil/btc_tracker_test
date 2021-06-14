import 'package:flutter/material.dart';
import 'package:btc_tracer_app/price_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BITCOIN TRACKER',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF274734)),
      home: PrintScreen(),
    );
  }
}
