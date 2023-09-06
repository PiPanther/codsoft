import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/home.dart';
import 'package:todolist/utils/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To_Do app',
      themeMode: ThemeMode.system,
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}
