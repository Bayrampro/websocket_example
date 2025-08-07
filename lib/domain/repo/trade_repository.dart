import 'package:websocket_example/domain/entities/trade_entity.dart';

abstract interface class TradeRepository {
  void subscribeToTrades(String symbol);
  Stream<TradeEntity> get trades;
  void disconnect();
}
