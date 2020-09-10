import 'package:cryptocurrency_tracker_flutter/utilities/database.dart';
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
    trackerItems = TrackerBrain().trackerItems;
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
          children: [
            Container(
              alignment: Alignment.center,
              height: 70.0,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text('1 ${trackerItems[0].cryptoCurrency}'),
                  Text('='),
                  Text('32 ${trackerItems[0].fiatCurrency}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
