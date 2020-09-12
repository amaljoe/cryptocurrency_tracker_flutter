import 'package:cryptocurrency_tracker_flutter/components/bottom_chat.dart';
import 'package:cryptocurrency_tracker_flutter/components/chat_message.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/chat_brain.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';

class CurrencyPage extends StatefulWidget {
  static String id = 'currency_page';
  @override
  _CurrencyPageState createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage> {
  List<ChatMessage> chatMessages = [];
  String enteredText;
  ChatBrain chatBrain = ChatBrain();

  void handleMessage() {
    chatBrain.handleMessage(enteredText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
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
          child: ListView.builder(
            reverse: true,
            itemCount: chatBrain.chatMessages.length,
            itemBuilder: (context, index) {
              return chatBrain.chatMessages[index];
            },
          ),
        ),
        BottomChat(
          onPressed: () {
            setState(() {
              chatBrain.handleMessage(enteredText);
            });
          },
          onTextChanged: (value) {
            enteredText = value;
          },
        ),
      ]),
    );
  }
}
