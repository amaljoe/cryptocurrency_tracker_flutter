import 'dart:convert';

import 'package:cryptocurrency_tracker_flutter/utilities/tracker_item.dart';
import 'package:http/http.dart' as http;

const String url = 'https://rest.coinapi.io/v1/exchangerate';
const String apiKey = '43B8B1DB-BB56-4442-A79B-91CD8AC39230';

class NetworkHelper {
  static Future<void> getConversion(List<TrackerItem> trackerItems) async {
    print('getting to network helper');
    for (TrackerItem trackerItem in trackerItems) {
      http.Response response = await http.get(
          '$url/${trackerItem.cryptoCurrency}/${trackerItem.fiatCurrency}?apikey=$apiKey');
      if (response.statusCode != 200) {
        print(response.statusCode);
      } else {
        var decodedData = jsonDecode(response.body);
        double price = decodedData['rate'];
        print(price);
        trackerItem.convertedPrice = price.toInt();
      }
    }
  }
}
