import 'dart:convert';

import 'package:websocket_example/data/data_sources/binance_socket_client.dart';
import 'package:websocket_example/data/models/ticker_model.dart';
import 'package:websocket_example/domain/entities/ticker_entity.dart';
import 'package:websocket_example/domain/repo/binance_repository.dart';

class TickerRepositoryImpl implements BinanceRepository<TickerEntity> {
  final BinanceSocketClient _client;

  TickerRepositoryImpl(this._client);

  @override
  void subscribeTo(String symbol) {
    _client.connectToStream(symbol, isSingle: false);
  }

  @override
  Stream<TickerEntity> get data => _client.stream
      .map((rawJson) => jsonDecode(rawJson) as Map<String, dynamic>)
      .map((json) => TickerModel.fromJson(json))
      .map((model) => model.toEntity());

  @override
  void disconnect() {
    _client.disconnect();
  }
}
