import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pick_in_store/home/views/home.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SignIn extends StatelessWidget {
  static const ROUTE = '/signin';

  String scanRes = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrieren'),
      ),
      body: _body(context) ,
    );
  }

  Widget _body(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Scannen Sie bitte Ihre Storekarte ein'),
           Padding(
             padding: EdgeInsets.all(16),
             child: ElevatedButton(

                 onPressed: () async {
                   scanRes = await FlutterBarcodeScanner.scanBarcode(
                       '#FF0000',
                       'Abbrechen',
                       true,
                       ScanMode.BARCODE);

                   var instance = await SharedPreferences.getInstance();
                   instance.setString('filiale-ID', scanRes);
                   Navigator.pushReplacementNamed(context, Home.ROUTE);
                 },
                 child: Text('Einscannen')),
           ),
        ],
      ),
    );
  }
}
