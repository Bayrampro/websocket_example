import 'package:flutter/foundation.dart';

class PercentChangeNotifier extends ChangeNotifier {
  double _btc = 0;
  double _eth = 0;
  double _bnb = 0;

  double get btc => _btc;
  double get eth => _eth;
  double get bnb => _bnb;

  void update(String symbol, double percent) {
    if (symbol == "btcusdt@ticker") {
      _btc = percent;
    } else if (symbol == "ethusdt@ticker") {
      _eth = percent;
    } else if (symbol == "bnbusdt@ticker") {
      _bnb = percent;
    }
    notifyListeners();
  }
}
