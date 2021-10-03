import 'package:flutter/material.dart';
import 'notification/notification_service.dart';
import 'pick_up_order/views/pick_up_order.dart';
import 'package:pick_in_store/sign_in/sign_in.dart';
import 'package:pick_in_store/splash.dart';
import 'package:pick_in_store/utils/dependencies.dart';
import 'home/views/home.dart';
import 'order/view/order.dart';

void main() async{
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService().init();
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
        PickUpOrder.ROUTE : (context) => PickUpOrder(),
        SignIn.ROUTE : (context) => SignIn()
      },
    );
  }
}