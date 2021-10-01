import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MoveUpService {

  final String GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT = "https://pickinstore.getsandbox.com/getunpickedorders";
  final String GET_PICKED_ORDERS_FOR_STORE_ENDPOINT = "https://pickinstore.getsandbox.com/getpickedorders";

  Future<String> getUnpickedOrders() async{

    var instance = await SharedPreferences.getInstance();

    var url = Uri.parse("${GET_UNPICKED_ORDERS_FOR_STORE_ENDPOINT}?id=${instance.getString('filiale-ID')}");
    var response = await http.get(url);
    if(response.statusCode == 200){
      var rawXMLResponse = response.body;

      return rawXMLResponse;

    }else{
      throw Exception();
    }
  }

  Future<String> getPickedOrders() async{
    var instance = await SharedPreferences.getInstance();
    var url = Uri.parse("${GET_PICKED_ORDERS_FOR_STORE_ENDPOINT}?id=${instance.getString('filiale-ID')}");
    var response = await http.get(url);
    if(response.statusCode == 200){
      var rawXMLResponse = response.body;

      return rawXMLResponse;

    }else{

      throw Exception();
    }
  }


}