import 'package:cryptocurrency_tracker_flutter/components/bottom_chat.dart';
import 'package:cryptocurrency_tracker_flutter/components/chat_message.dart';
import 'package:cryptocurrency_tracker_flutter/components/suggestion_item.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/chat_brain.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_brain.dart';
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
  TextEditingController messageController = TextEditingController();
  ChatBrain chatBrain;

  void initState() {
    super.initState();
    chatBrain = ChatBrain(onEnd: () {
      Navigator.pop(context);
    });
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
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              color: Colors.black12,
              height: 130,
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: chatBrain.getSuggestions().length,
                      itemBuilder: (context, index) {
                        return SuggestionItem(
                          text: chatBrain
                              .getSuggestions()
                              .reversed
                              .elementAt(index),
                          onPressed: () {
                            setState(() {
                              enteredText = chatBrain
                                  .getSuggestions()
                                  .reversed
                                  .elementAt(index);
                              chatBrain.handleMessage(enteredText);
                            });
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 80,
                  ),
                ],
              ),
            ),
            BottomChat(
              controller: messageController,
              onPressed: () {
                setState(() {
                  messageController.clear();
                  chatBrain.handleMessage(enteredText);
                });
              },
              onTextChanged: (value) {
                enteredText = value;
              },
            ),
          ],
        )
      ]),
    );
  }
}
