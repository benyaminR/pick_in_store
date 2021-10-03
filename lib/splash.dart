import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_in_store/notification/notification_service.dart';
import 'package:pick_in_store/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/views/home.dart';

class Splash extends StatefulWidget{
  static const ROUTE = '/';

  @override
  _SplashState createState() => _SplashState();

}

class _SplashState extends State<Splash> {

  @override
  void initState() {
    super.initState();
    NotificationService().init(selectNotification);
  }

  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      bool hasID = value.getString('filiale-ID') != null;
      Navigator.pushReplacementNamed(context, hasID ? Home.ROUTE : SignIn.ROUTE);
    });
    return Scaffold();
  }

  Future selectNotification(String? payload) async {
    await Navigator.of(context).pushNamed(Home.ROUTE);
  }

}