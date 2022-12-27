import 'package:flutter/material.dart';
import 'package:untitled1/Screens/Login.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String appTitle = 'Teacher Student App';
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: appTitle,
    home: const Login(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.cyan,
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.white
      )
    ),
  );
}
