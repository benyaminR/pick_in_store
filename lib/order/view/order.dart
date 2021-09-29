import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pick_in_store/home/model/article_model.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';

class Order extends StatelessWidget{
 static const ROUTE = '/order';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as OrderModalData;

    return Scaffold(
      appBar: AppBar(
        title: Text(args.order.orderID),
      ),
      body: _ordersBody(context,args.order.articles),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
              '#FF0000',
              'Abbrechen',
              true,
              ScanMode.QR);
        },
        child: Icon(Icons.qr_code)
      ),
    );
  }

  Widget _ordersBody(BuildContext context, List<ArticleModel> articles){
    return ListView(
      children: articles.map((article) => Card(
        margin: EdgeInsets.fromLTRB(8, 4, 4, 8),
        child: ListTile(
            title: Text(article.description),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${article.quantity} Stück"),
              ],
            ),
            trailing: Text(article.articleID)
        ),
      )
      ).toList()
    );
  }


}
class OrderModalData{
  final ListItemOrderModel order;
  OrderModalData({required this.order});

}
