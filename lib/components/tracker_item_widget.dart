import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class TrackerItemWidget extends StatelessWidget {
  final String text;

  TrackerItemWidget({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: kBoxShadow,
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
        child: Text(text, style: kTrackItemTextStyle),
      ),
    );
  }
}
