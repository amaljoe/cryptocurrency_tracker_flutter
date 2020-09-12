import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_brain.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_item.dart';
import 'package:cryptocurrency_tracker_flutter/components/chat_message.dart';
import 'package:flutter/material.dart';

class ChatBrain {
  final Function onEnd;
  Question question = Question.add;
  String message;
  String cryptoCurrency;
  String fiatCurrency;
  List<Widget> chatMessages = [
    ChatMessage(
      text: 'Do you want to add a new crypto currency ?',
      messageType: MessageType.you,
    )
  ];

  ChatBrain({@required this.onEnd});

  void addCrypto() {
    if (message.toLowerCase() == 'yes') {
      chatMessages.insert(
        0,
        ChatMessage(
          text: 'Which crypto currency do you want to add ?',
          messageType: MessageType.you,
        ),
      );
      question = Question.crypto;
    } else if (message.toLowerCase() == 'no') {
      chatMessages.insert(
        0,
        ChatMessage(
          text: 'Okay',
          messageType: MessageType.you,
        ),
      );
      question = Question.nil;
      onEnd();
    } else {
      chatMessages.insert(
        0,
        ChatMessage(
          text: 'Yes or No ?',
          messageType: MessageType.you,
        ),
      );
    }
  }

  void whichCrypto() {
    message = message.toUpperCase();
    for (String item in TrackerBrain.cryptoCurrencies) {
      if (item == message) {
        cryptoCurrency = message;
        chatMessages.insert(
          0,
          ChatMessage(
            text:
                'In which real world currency do you want to know the price in ?',
            messageType: MessageType.you,
          ),
        );
        question = Question.fiat;
        return;
      }
    }
    chatMessages.insert(
      0,
      ChatMessage(
        text: 'Crypto currency not found, please recheck and try again.',
        messageType: MessageType.you,
      ),
    );
  }

  void whichFiat() {
    message = message.toUpperCase();
    for (String item in TrackerBrain.fiatCurrencies) {
      if (item == message) {
        fiatCurrency = message;
        chatMessages.insert(
          0,
          ChatMessage(
            text: 'Crypto currency successfully added to the list',
            messageType: MessageType.you,
          ),
        );
        chatMessages.insert(
          0,
          ChatMessage(
            text: 'Do you want to add another crypto currency?',
            messageType: MessageType.you,
          ),
        );
        question = Question.add;
        updateTrackerList();
        return;
      }
    }
    chatMessages.insert(
      0,
      ChatMessage(
        text: 'Currency not found, please recheck and try again.',
        messageType: MessageType.you,
      ),
    );
  }

  void updateTrackerList() {
    TrackerBrain.trackerItems.add(TrackerItem(
        cryptoCurrency: cryptoCurrency, fiatCurrency: fiatCurrency));
  }

  List<String> getSuggestions() {
    switch (question) {
      case Question.add:
        return TrackerBrain.yesOrNo;
      case Question.crypto:
        return TrackerBrain.cryptoCurrencies;
      case Question.fiat:
        return TrackerBrain.fiatCurrencies;
      default:
        return [];
    }
  }

  void handleMessage(String message) {
    if (message == null || message == '') {
      return;
    }
    this.message = message;
    chatMessages.insert(
      0,
      ChatMessage(
        text: message,
        messageType: MessageType.me,
      ),
    );
    switch (question) {
      case Question.add:
        addCrypto();
        return;
      case Question.crypto:
        whichCrypto();
        return;
      case Question.fiat:
        whichFiat();
        return;
      default:
        return;
    }
  }
}
