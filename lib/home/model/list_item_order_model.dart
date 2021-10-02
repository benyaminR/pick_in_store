import 'package:pick_in_store/home/model/article_model.dart';
import 'customer_model.dart';

class ListItemOrderModel{
  final String orderID;
  final String date;
  final String price;
  final List<ArticleModel> articles;
  final CustomerModel customer;

  ListItemOrderModel({
    required this.orderID,
    required this.date,
    required this.price,
    required this.articles,
    required this.customer
  });
}



