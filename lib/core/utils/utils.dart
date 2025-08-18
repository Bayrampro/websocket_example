import 'package:websocket_example/core/constants/assets.dart';

class Utils {
  static String getCoinIcon(String symbol) {
    if (symbol == "btcusdt@ticker") {
      return Assets.bitcoinIcon;
    } else if (symbol == "ethusdt@ticker") {
      return Assets.ethIcon;
    } else if (symbol == "bnbusdt@ticker") {
      return Assets.bnbIcon;
    } else {
      return '';
    }
  }
}
