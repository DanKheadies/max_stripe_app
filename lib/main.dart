import 'package:flutter/material.dart';

import 'package:max_stripe_app/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF000A1F),
          secondary: Color(0xFF000A1f),
        ),
        primaryColor: Colors.white,
      ),
      home: const HomeScreen(),
    );
  }
}
