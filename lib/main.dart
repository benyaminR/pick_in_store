import 'package:flutter/material.dart';
import 'home/views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        accentColor: Colors.redAccent,
      ),
      initialRoute: Home.ROUTE,
      routes: {
        Home.ROUTE: (context) => Home(),
      },
    );
  }
}