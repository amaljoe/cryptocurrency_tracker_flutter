import 'package:cryptocurrency_tracker_flutter/components/bottom_chat.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';

class CurrencyPage extends StatefulWidget {
  static String id = 'currency_page';
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          color: Colors.white,
          size: 24,
        ),
        centerTitle: true,
        title: Text(
          'CRYPTOTRACKER',
          style: kTitleTextStyle,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: Container(),
        ),
        BottomChat(),
      ]),
    );
  }
}
