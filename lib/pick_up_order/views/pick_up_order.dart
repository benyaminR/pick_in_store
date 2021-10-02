import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';
import 'package:pick_in_store/home/views/home.dart';
import 'package:pick_in_store/pick_up_order/controller/complete_order/complete_order_bloc.dart';
import 'package:pick_in_store/utils/dependencies.dart';
import 'package:pick_in_store/utils/pick_up_barcode_generator.dart';

class PickUpOrder extends StatelessWidget {
  static const ROUTE = '/pickup';

  @override
  Widget build(BuildContext context) {
    var order =
        (ModalRoute.of(context)!.settings.arguments as PickUpOrderModal).order;

    return Scaffold(
      appBar: AppBar(
        title: Text('Abholen'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: FittedBox(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.lightGreenAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(180),
                )),
            onPressed: () => getIt<CompleteOrderBloc>()
                .add(CompleteOrderEvent(orderID: order.orderID)),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Text(
                    'Abschließen',
                    style: TextStyle(fontSize: 26),
                  ),
                  Icon(
                    Icons.check,
                    size: 36,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: _getBody(order),
    );
  }

  _getBody(ListItemOrderModel order) {
    return BlocProvider.value(
      value: getIt<CompleteOrderBloc>(),
      child: BlocConsumer<CompleteOrderBloc, CompleteOrderState>(
        listener: (context, state) {
          print(state.status);
          if (state.status == CompleteOrderStatus.Loading)
            showDialog(
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Die Bestellung wird abgeschlossen...'),
                  content: Container(
                      width: 100, height: 5, child: LinearProgressIndicator()),
                );
              },
            );
          if (state.status == CompleteOrderStatus.Loaded) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (c) => Home()), (route) => false);
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            spreadRadius: 2)
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(16))),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _pickUpQRCode(order),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "${order.customer.firstname} ${order.customer.surename}",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _pickUpQRCode(ListItemOrderModel order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
            ],
            borderRadius: BorderRadius.all(Radius.circular(16))),
        padding: EdgeInsets.all(16),
        child: BarcodeWidget(
          width: 250,
          height: 100,
          barcode: Barcode.codabar(),
          data: generatePickUpBarcodeFor("50001142", order.price),
        ),
      ),
    );
  }
}

class PickUpOrderModal {
  final ListItemOrderModel order;

  PickUpOrderModal({required this.order});
}
