import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget{
  static const ROUTE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bestellungen'),
      ),
      body: Center(
        child: Text('Under Construction!'),
      ),
    );
  }

}