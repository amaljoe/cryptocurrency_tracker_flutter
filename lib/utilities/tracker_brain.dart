import 'tracker_item.dart';

class TrackerBrain {
  static List<TrackerItem> trackerItems = [
    TrackerItem(id: 1, cryptoCurrency: 'PIE', fiatCurrency: 'INR'),
    TrackerItem(id: 2, cryptoCurrency: 'BTC', fiatCurrency: 'USD'),
  ];
  static List<String> cryptoCurrencies = ['BTC', 'ETH', 'NEO', 'PIE'];
  static List<String> fiatCurrencies = ['INR', 'USD', 'EUR', 'NZD'];
  static List<String> yesOrNo = ['Yes', 'No'];
}
