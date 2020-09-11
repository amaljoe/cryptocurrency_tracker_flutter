import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final MessageType messageType;

  ChatMessage({@required this.text, @required this.messageType});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: messageType == MessageType.me
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: kBoxShadow,
          color:
              messageType == MessageType.me ? Colors.lightBlue : Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        child: Text(
          text,
          style: kChatTextStyle.copyWith(
            color: messageType == MessageType.me ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
