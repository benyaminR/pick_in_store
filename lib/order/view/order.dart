import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:pick_in_store/home/model/article_model.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';

class Order extends StatefulWidget{
  static const ROUTE = '/order';

  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {

  List<bool> _alreadyScannedArticles = [];

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as OrderModalData;
    var order = args.order;
    if(_alreadyScannedArticles.isEmpty)
      order.articles.forEach((element) { _alreadyScannedArticles.add(false);});
    return Scaffold(
      appBar: AppBar(
        title: Text(args.order.orderID),
      ),
      body: _ordersBody(context,args.order.articles),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            !_alreadyScannedArticles.any((element)=> !element ) ?
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: 'complete',
                onPressed: ()=>{
                  Navigator.of(context).pop()
                },
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.done),
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FloatingActionButton(
                heroTag: 'incomplete',
                onPressed: ()=>{
                  showDialog(context: context, builder: (context) => AlertDialog(
                    title: Text('Unvollständige Bestellung'),
                    content: Text('Möchten Sie diese Bestellung als unvollständig vermerken?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Abberechen'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Bestellung wurde als unvollständig vermerkt!')));
                        },
                        child: Text('Fortsetzen'),
                      ),
                    ],
                  ),)

                },
                backgroundColor: Colors.redAccent,
                child: Icon(Icons.close),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _ordersBody(BuildContext context, List<ArticleModel> articles){
    return ListView(
      children: List.generate(articles.length, (index) {
        var article = articles[index];
        return Card(
          color: _alreadyScannedArticles[index] ? Colors.lightGreen : Colors.white,
          margin: EdgeInsets.fromLTRB(8, 4, 4, 8),
          child: ListTile(
            onTap: () => _alreadyScannedArticles[index] ? null:_scanArticle(articles[index], context,index),
            title: Text(article.description, style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${article.quantity} Stück"),
              ],
            ),
            //trailing: Text(article.articleID)
          ),
        );
      }),
    );
  }

  _scanArticle(ArticleModel article, BuildContext context, int index) async{
    String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#FF0000',
        'Abbrechen',
        true,
        ScanMode.BARCODE);
    if(barcodeScanRes != article.articleID){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Der Scanning-Vorgang wurde abgebrochen')));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Artikel gefunden!')));
      setState(() {
        _alreadyScannedArticles[index] = true;

      });
    }
  }

  _alreadyScannedEverything(){
    for (var value in _alreadyScannedArticles) {
      if(value == false) return false;
    }
    return true;
  }
}
class OrderModalData{
  final ListItemOrderModel order;
  OrderModalData({required this.order});

}
