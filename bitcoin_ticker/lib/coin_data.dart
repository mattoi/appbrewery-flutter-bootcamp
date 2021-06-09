import 'package:http/http.dart' as http;
import 'dart:convert';

const String apikey = 'CEF1BE79-9DE4-4112-AE4A-D8B2EC3B960F';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  CoinData();
  Future getCoinData(String cryptoCurrency, String selectedCurrency) async {
    String url =
        'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$selectedCurrency?apikey=$apikey';
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body)['rate'];
    } else {
      print(response.statusCode);
      return '?';
    }
  }
}
