import 'package:cryptocurrency_tracker_flutter/components/tracker_item_widget.dart';
import 'package:cryptocurrency_tracker_flutter/screens/currency_page.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/constants.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_brain.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/tracker_item.dart';
import 'package:flutter/material.dart';
import 'package:cryptocurrency_tracker_flutter/utilities/networking.dart';

class TrackerPage extends StatefulWidget {
  static String id = 'tracker_page';
  @override
  _TrackerPageState createState() => _TrackerPageState();
}

class _TrackerPageState extends State<TrackerPage> {
  List<TrackerItem> trackerItems;
  bool showSpinner;

  @override
  void initState() {
    super.initState();
    getConversionRate();
  }

  @override
  void deactivate() {
    super.deactivate();
    print('deactivated');
  }

  void getConversionRate() async {
    setState(() {
      showSpinner = true;
    });
    await NetworkHelper.getConversion(TrackerBrain.trackerItems);
    setState(() {
      showSpinner = false;
    });
    print('getting back also');
    for (TrackerItem trackerItem in trackerItems) {
      print(trackerItem.convertedPrice);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              getConversionRate();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: Text(
          'CRYPTOTRACKER',
          style: kTitleTextStyle,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(5)),
        ),
      ),
      body: contentArea(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, CurrencyPage.id).then((value) {
            getConversionRate();
          });
        },
      ),
    );
  }

  Widget contentArea() {
    if (showSpinner) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    if (TrackerBrain.trackerItems.isEmpty) {
      return Center(
        child: Text('Nothing is here'),
      );
    }
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: TrackerBrain.trackerItems.length,
        itemBuilder: (context, index) {
          String cryptoCurrency =
              TrackerBrain.trackerItems[index].cryptoCurrency;
          String fiatCurrency = TrackerBrain.trackerItems[index].fiatCurrency;
          int convertedPrice = TrackerBrain.trackerItems[index].convertedPrice;
          String text = '1 $cryptoCurrency = $convertedPrice $fiatCurrency';
          return TrackerItemWidget(
            text: text,
            onPressed: () {
              setState(() {
                TrackerBrain.trackerItems.removeAt(index);
              });
            },
          );
        },
      ),
    );
  }
}
