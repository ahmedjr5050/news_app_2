import 'package:flutter/material.dart';
import 'package:news/pages/homescreen.dart';
import 'package:news/shared/sharedd.dart';

void main() {
  runApp(const MyApp());
  PreferenceUtils.init();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  static MyAppState? instance;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  void setTheme() {
    setState(() {}); // Rebuild the main application
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: PreferenceUtils.getString(PrefKeys.theme) == 'Dark'
          ? ThemeData.dark()
          : ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
