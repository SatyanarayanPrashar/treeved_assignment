import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/LocalStorage.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Constants/themes.dart';
import 'package:treeved_assignment/Screens/AuthPages/loginpage.dart';
import 'package:treeved_assignment/Screens/HomePage/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String currentTheme = await LocalStorage.getTheme() ?? "light";

  runApp(MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;

  MyApp({super.key, required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(theme)),
      ],
      child: Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeProvider.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: LoginPage(),
        );
      }),
    );
  }
}
