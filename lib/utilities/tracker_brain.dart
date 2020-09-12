import 'tracker_item.dart';

class TrackerBrain {
  static List<TrackerItem> trackerItems = [
    TrackerItem(id: 1, cryptoCurrency: 'ETH', fiatCurrency: 'USD'),
    TrackerItem(id: 2, cryptoCurrency: 'NEO', fiatCurrency: 'NZD'),
    TrackerItem(id: 3, cryptoCurrency: 'PIE', fiatCurrency: 'INR'),
    TrackerItem(id: 4, cryptoCurrency: 'ETH', fiatCurrency: 'USD'),
    TrackerItem(id: 5, cryptoCurrency: 'ETH', fiatCurrency: 'USD'),
  ];
  static List<String> cryptoCurrencies = ['BTC', 'ETH', 'NEO', 'PIE'];
  static List<String> fiatCurrencies = ['INR', 'USD', 'EUR', 'NZD'];
}
