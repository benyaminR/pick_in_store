import 'package:http/http.dart' as http;

class MoveUpService {

  final String GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT = "https://pickinstore.getsandbox.com/getOrders";
  final String GET_PICKED_ORDERS_FOR_STORE_ENDPOINT = "https://pickinstore.getsandbox.com/getpickedorders";

  Future<String> getUnpickedOrders() async{

    var url = Uri.parse(GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT);
    var response = await http.get(url);
    if(response.statusCode == 200){
      var rawXMLResponse = response.body;

      return rawXMLResponse;

    }else{
      throw Exception();
    }
  }

  Future<String> getPickedOrders() async{
    var url = Uri.parse(GET_PICKED_ORDERS_FOR_STORE_ENDPOINT);
    var response = await http.get(url);
    if(response.statusCode == 200){
      var rawXMLResponse = response.body;

      return rawXMLResponse;

    }else{

      throw Exception();
    }
  }


}