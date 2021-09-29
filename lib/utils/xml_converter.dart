import 'package:pick_in_store/home/model/article_model.dart';
import 'package:pick_in_store/home/model/customer_model.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';
import 'package:xml/xml.dart';

class XMLConverter{

  List<ListItemOrderModel> convertXMLOrdersToListItemOrders(String rawXML){

    List<ListItemOrderModel> convertedItems = [];

    final document = XmlDocument.parse(rawXML);
    // data-elemente durchlaufen
    var deliveries = document.findAllElements("aroma_order:deliveries");
    for (var delivery in deliveries) {
      convertedItems.add(ListItemOrderModel(
          date: delivery.getElement("aroma_order:orderDate")!.text,
          orderID: delivery.getElement("aroma_order:orderId")!.text,
          articles: delivery.findAllElements("aroma_order:items").toList()
              .map((orderItem) => ArticleModel(
              articleID: orderItem.getElement("aroma_order:skuId")!.text,
              description: orderItem.getElement("aroma_order:description")!.text,
              price: orderItem.getElement("aroma_order:amountGross")!.text,
              quantity: double.parse(orderItem.getElement("aroma_order:quantity")!.text).toInt()
            )
          ).toList(),
          customer: CustomerModel(
            firstname: delivery.getElement("aroma_order:billTo")!.getElement("aroma_order:firstName")!.text,
            surename: delivery.getElement("aroma_order:billTo")!.getElement("aroma_order:lastName")!.text,
          )
      )
      );
    }
    return convertedItems;
  }



}