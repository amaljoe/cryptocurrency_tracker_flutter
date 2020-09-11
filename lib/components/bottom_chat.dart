import 'package:flutter/material.dart';

class BottomChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
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
                onPressed: null)
          ],
        ),
      ),
    );
  }
}
