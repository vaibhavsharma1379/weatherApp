import 'package:flutter/material.dart';
import 'package:weatherhub/screens/loading_screen.dart';
import 'package:weatherhub/screens/city_screen.dart';
import 'package:weatherhub/screens/location_screen.dart';
import 'screens/test.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
