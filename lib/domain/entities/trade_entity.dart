import 'package:websocket_example/data/models/event_type_enum.dart';
import 'package:websocket_example/data/models/trade_model.dart';

class TradeEntity {
  final EventType eventType;
  final DateTime eventTime;
  final String symbol;
  final int tradeId;
  final double price;
  final double quantity;
  final DateTime tradeTime;
  final bool isBuyerMaker;
  final bool isBestPriceMatch;

  TradeEntity({
    required this.eventType,
    required this.eventTime,
    required this.symbol,
    required this.tradeId,
    required this.price,
    required this.quantity,
    required this.tradeTime,
    required this.isBuyerMaker,
    required this.isBestPriceMatch,
  });

  TradeModel toModel() {
    return TradeModel(
      eventType: eventType,
      eventTime: eventTime.millisecondsSinceEpoch,
      symbol: symbol,
      tradeId: tradeId,
      price: price.toString(),
      quantity: quantity.toString(),
      tradeTime: tradeTime.millisecondsSinceEpoch,
      isBuyerMaker: isBuyerMaker,
      isBestPriceMatch: isBestPriceMatch,
    );
  }
}
