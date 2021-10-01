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
//      appBar: AppBar(
//        title: Text('Registrieren'),
//      ),
      body: _body(context) ,
    );
  }

  Widget _body(context){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Scannen Sie bitte Ihre Storekarte ein', style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),),
           Padding(
             padding: EdgeInsets.all(16),
             child: Container(
               width: 200,
               height: 50,
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
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text('Einscannen',style: TextStyle(
                         fontSize: 20,
                       ),),
                       Icon(Icons.camera_alt)
                     ],
                   )),
             ),
           ),
        ],
      ),
    );
  }
}
