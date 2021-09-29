import 'package:flutter/material.dart';
import 'package:pick_in_store/sign_in/sign_in.dart';
import 'package:pick_in_store/splash.dart';
import 'package:pick_in_store/utils/dependencies.dart';
import 'home/views/home.dart';
import 'order/view/order.dart';

void main() {
  configureDependencies();
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
      initialRoute: Splash.ROUTE,
      routes: {
        Splash.ROUTE:(context) => Splash(),
        Home.ROUTE: (context) => Home(),
        Order.ROUTE : (context) => Order(),
        SignIn.ROUTE : (context) => SignIn()
      },
    );
  }
}