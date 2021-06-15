import 'package:flutter/material.dart';
import 'package:btc_tracer_app/views/price_screen.dart';
import 'package:flutter_config/flutter_config.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await FlutterConfig.loadEnvVariables();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // print(FlutterConfig.get('API_KEY'));
    return MaterialApp(
      title: 'BITCOIN TRACKER',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF274734)),
      home: PrintScreen(),
    );
  }
}
