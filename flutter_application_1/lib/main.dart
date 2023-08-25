import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DULCERIA LAS BBB',
       routes: {
        'login' : (_) => LoginScreen(),
        'home': (_)=> HomeScreen(),
       },
       initialRoute: 'login',
    );
  }
}
