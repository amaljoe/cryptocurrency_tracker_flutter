import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:flutter/material.dart';

class BottomChat extends StatelessWidget {
  final Function onTextChanged;
  final Function onPressed;
  final TextEditingController controller;

  BottomChat(
      {@required this.onTextChanged,
      @required this.onPressed,
      @required this.controller});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        boxShadow: kBoxShadow,
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: 80,
      child: Center(
        child: Row(
          children: [
            Container(
              child: TextField(
                controller: controller,
                onChanged: onTextChanged,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 20, bottom: 10),
                    border: InputBorder.none,
                    hintText: 'Enter you message'),
              ),
              width: MediaQuery.of(context).size.width * 0.8,
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.lightBlue),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
            IconButton(
              icon: Icon(
                Icons.send,
                color: Colors.lightBlue,
                size: 40,
              ),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
