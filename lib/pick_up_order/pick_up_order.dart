import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';

class PickUpOrder extends StatelessWidget {
  static const ROUTE = '/pickup';


  @override
  Widget build(BuildContext context) {

    var order = (ModalRoute.of(context)!.settings.arguments as PickUpOrderModal).order;

    return Scaffold(
      appBar: AppBar(
        title: Text('Abholen'),
      ),
      body: _getBody(order),
    );
  }

  _getBody(ListItemOrderModel order){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment : MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2
                  )
                ],
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment : MainAxisAlignment.center,
                children: [
                  _pickUpQRCode(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${order.customer.firstname} ${order.customer.surename}",style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold
                    ),),
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }


  _pickUpQRCode(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(16))
        ),
        padding: EdgeInsets.all(16),
        child: BarcodeWidget(
          width: 250,
          height: 250,
          barcode: Barcode.qrCode(),
          data: "",
        ),
      ),
    );
  }
}

class PickUpOrderModal{
  final ListItemOrderModel order;
  PickUpOrderModal({required this.order});
}