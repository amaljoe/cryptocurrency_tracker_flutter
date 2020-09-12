import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';

class SettingsPage extends StatefulWidget {
  static String id = 'settings_page';
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'SETTINGS',
            style: kTitleTextStyle,
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              'Update Interval',
              style: kChatTextStyle,
            )
          ],
        ),
      ),
    );
  }
}
