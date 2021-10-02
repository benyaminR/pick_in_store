import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MockUpService {
  final String GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT =
      "https://pickinstore.getsandbox.com/getunpickedorders";
  final String GET_PICKED_ORDERS_FOR_STORE_ENDPOINT =
      "https://pickinstore.getsandbox.com/getpickedorders";
  final String UPDATE_ORDER_STATUS =
      "https://pickinstore.getsandbox.com/updateOrderStatus";

  Future<String> getUnpickedOrders() async {
    var instance = await SharedPreferences.getInstance();

    var url = Uri.parse(
        "$GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT?id=${instance.getString('filiale-ID')}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var rawXMLResponse = response.body;

      return rawXMLResponse;
    } else {
      throw Exception();
    }
  }

  Future<String> getPickedOrders() async {
    var instance = await SharedPreferences.getInstance();
    var url = Uri.parse(
        "$GET_PICKED_ORDERS_FOR_STORE_ENDPOINT?id=${instance.getString('filiale-ID')}");
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var rawXMLResponse = response.body;

      return rawXMLResponse;
    } else {
      throw Exception();
    }
  }

  Future<bool> updateOrderStatus(String status, String orderID) async {
    var instance = await SharedPreferences.getInstance();
    var url = Uri.parse(
        "$UPDATE_ORDER_STATUS?id=${instance.getString('filiale-ID')}&orderid=$orderID&status=$status");
    var response = await http.post(url);
    if (response.statusCode == 200) {
      return Future.value(true);
    } else {
      throw Exception();
    }
  }
}
