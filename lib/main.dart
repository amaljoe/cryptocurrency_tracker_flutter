import 'package:flutter/material.dart';
import 'screens/currency_page.dart';
import 'screens/tracker_page.dart';
import 'screens/settings_page.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primaryColor: Colors.lightBlue, scaffoldBackgroundColor: Colors.white),
    initialRoute: CurrencyPage.id,
    routes: {
      CurrencyPage.id: (context) => CurrencyPage(),
      TrackerPage.id: (context) => TrackerPage(),
      SettingsPage.id: (context) => SettingsPage(),
    },
  ));
}
