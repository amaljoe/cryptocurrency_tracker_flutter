import 'package:flutter/material.dart';

class TrackerItem {
  int id;
  String cryptoCurrency;
  String fiatCurrency;
  int convertedPrice;

  TrackerItem({
    this.id,
    @required this.cryptoCurrency,
    @required this.fiatCurrency,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cryptoCurrency': cryptoCurrency,
      'fiatCurrency': fiatCurrency,
    };
  }
}
