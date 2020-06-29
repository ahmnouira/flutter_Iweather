import 'package:Iweather/src/pages/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iweather',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      darkTheme: ThemeData(primarySwatch: Colors.blueGrey),
      themeMode: ThemeMode.light,
      home: Home(),
    );
  }
}
