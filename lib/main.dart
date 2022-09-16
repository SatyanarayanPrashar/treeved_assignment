import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/discover.dart';
import 'package:treeved_assignment/Screens/homePage.dart';
import 'package:treeved_assignment/Screens/ss.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: DiscoverPage(),
      // home: MainHome(),
      home: HomePage(),
    );
  }
}
