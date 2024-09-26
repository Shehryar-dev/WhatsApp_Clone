import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Whatsapp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor:const Color(0xff005B54)),
        textTheme:const TextTheme(),
        useMaterial3: true,
      ),
      home: home_screen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
