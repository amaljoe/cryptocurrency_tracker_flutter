import 'package:flutter/material.dart';

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
          title: Text(
        'Settings Page',
      )),
    );
  }
}
