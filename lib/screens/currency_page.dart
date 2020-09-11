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
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          boxShadow: kBoxShadow,
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          'Do you want to add new crypto currency ?',
                          style: kChatTextStyle,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        BottomChat(
          onPressed: () {},
          onTextChanged: (value) {
            print(value);
          },
        ),
      ]),
    );
  }
}
