import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_brain.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_item.dart';

class ChatBrain {
  Question question = Question.add;
  String msg;
  String crypto;
  String fiat;
  TrackerItem trackerItem;

  bool addCrypto() {
    if (msg.toLowerCase() == 'yes') {
      question = Question.crypto;
      return true;
    }
    return false;
  }

  bool whichCrypto() {
    msg = msg.toUpperCase();
    for (String item in TrackerBrain.cryptoCurrencies) {
      if (item == msg) {
        crypto = msg;
        question = Question.fiat;
        return true;
      }
    }
    return false;
  }

  bool whichFiat() {
    msg = msg.toUpperCase();
    for (String item in TrackerBrain.fiatCurrencies) {
      if (item == msg) {
        fiat = msg;
        question = Question.ans;
        return true;
      }
    }
    return false;
  }

  bool answer() {}

  bool handleMessage(String msg) {
    this.msg = msg != null ? msg : '';
    bool status = false;
    switch (question) {
      case Question.add:
        status = addCrypto();
        return status;
      case Question.crypto:
        status = whichCrypto();
        return status;
      case Question.fiat:
        status = whichFiat();
        return status;
      case Question.ans:
        status = answer();
        return status;
      default:
        return status;
    }
  }
}
