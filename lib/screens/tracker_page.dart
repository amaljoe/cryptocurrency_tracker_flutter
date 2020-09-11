import 'package:cryptocurrency_tracker_flutter/components/tracker_item_widget.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_brain.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_item.dart';
import 'package:flutter/material.dart';

class TrackerPage extends StatefulWidget {
  static String id = 'tracker_page';
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  List<TrackerItem> trackerItems;

  @override
  void initState() {
    super.initState();
    getTrackerItems();
  }

  void getTrackerItems() {
    trackerItems = TrackerBrain.trackerItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Tracker Page',
      )),
      body: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [TrackerItemWidget(text: '1 BTC = 7,19,000 INR')],
        ),
      ),
    );
  }
}
