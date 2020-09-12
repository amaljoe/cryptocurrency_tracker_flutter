import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class SuggestionItem extends StatelessWidget {
  final String text;
  final Function onPressed;

  SuggestionItem({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            text,
            style: kChatTextStyle,
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
