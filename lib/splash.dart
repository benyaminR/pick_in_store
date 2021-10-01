import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pick_in_store/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home/views/home.dart';

class Splash extends StatelessWidget{
  static const ROUTE = '/';
  @override
  Widget build(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      bool hasID = value.getString('filiale-ID') != null;
      Navigator.pushReplacementNamed(context, hasID ? Home.ROUTE : SignIn.ROUTE);
    });
    return Scaffold();

  }

}