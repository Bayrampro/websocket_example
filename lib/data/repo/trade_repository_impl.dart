import 'dart:convert';

import 'package:rxdart/rxdart.dart';
import 'package:websocket_example/data/data_sources/binance_socket_client.dart';
import 'package:websocket_example/data/models/trade_model.dart';
import 'package:websocket_example/domain/entities/trade_entity.dart';
import 'package:websocket_example/domain/repo/trade_repository.dart';

class TradeRepositoryImpl implements TradeRepository {
  final BinanceSocketClient _client;

  TradeRepositoryImpl(this._client);

  @override
  void subscribeToTrades(String symbol) {
    _client.connectToStream("$symbol@trade");
  }

  @override
  Stream<TradeEntity> get trades => _client.stream
      .throttleTime(const Duration(milliseconds: 100))
      .map((rawJson) => jsonDecode(rawJson) as Map<String, dynamic>)
      .map((json) => TradeModel.fromJson(json))
      .map((model) => model.toEntity());

  @override
  void disconnect() {
    _client.disconnect();
  }
}
