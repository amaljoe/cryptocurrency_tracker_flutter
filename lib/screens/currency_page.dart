import 'package:cryptocurrency_tracker_flutter/components/bottom_chat.dart';
import 'package:cryptocurrency_tracker_flutter/components/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';

class CurrencyPage extends StatefulWidget {
  static String id = 'currency_page';
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  List<ChatMessage> chatMessages = [];

  @override
  void initState() {
    super.initState();
    updateList();
  }

  void updateList() {
    chatMessages.insert(
        0,
        ChatMessage(
          text: 'Do you want to add a new crypto currency ?',
          messageType: MessageType.you,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text: 'YES',
          messageType: MessageType.me,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text: 'Which cryptocurrency do you want to add ?',
          messageType: MessageType.you,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text: 'BTC',
          messageType: MessageType.me,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text:
              'In which real world currency do you want to know the price in ?',
          messageType: MessageType.you,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text: 'INR',
          messageType: MessageType.me,
        ));
    chatMessages.insert(
        0,
        ChatMessage(
          text: '1 BTC = 7,19,000 INR',
          messageType: MessageType.you,
        ));
  }

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
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        ),
      ),
      body: Column(children: [
        Expanded(
          child: ListView(
            children: chatMessages,
            reverse: true,
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
