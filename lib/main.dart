import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/authpages/loginpage.dart';
import 'package:treeved_assignment/Screens/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(brightness: Brightness.light, tabBarTheme: TabBarTheme()),
      home: LoginPage(),
    );
  }
}
