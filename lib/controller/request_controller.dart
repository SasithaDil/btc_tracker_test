// import 'package:btc_tracer_app/model/coin_data.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_config/flutter_config.dart';
// import 'package:btc_tracer_app/views/price_screen.dart';

class RequestController {
  Future<dynamic> getCoinData(String coin, String cryptoCurrency) async {
    var api = FlutterConfig.get('API_KEY');
    print(coin);

    http.Response response = await http.get(
      Uri.parse(
          'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$coin?apikey=$api'),
    );

    if (response.statusCode == 200) {
      var jsonDecodedData = jsonDecode(response.body);
      return jsonDecodedData;
    } else {
      print(response.statusCode);
    }
  }
}
