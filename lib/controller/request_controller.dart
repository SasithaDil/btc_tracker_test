import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';

class RequestController {
  Future<dynamic> getCoinData() async {
    var api = FlutterConfig.get('API_KEY');

    http.Response response = await http.get(
      Uri.parse('https://rest.coinapi.io/v1/exchangerate/BTC/USD?apikey=$api'),
    );

    if (response.statusCode == 200) {
      String data = response.body;
      var coin = jsonDecode(data)['asset_id_base'];
      print(coin);
      var apicurre = jsonDecode(data)['asset_id_quote'];
      print(apicurre);
      var rate = jsonDecode(data)['rate'];
      print(rate);
    } else {
      print(response.statusCode);
    }
    return response.body;
  }
}
