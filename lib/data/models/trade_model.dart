import 'package:json_annotation/json_annotation.dart';
import 'package:websocket_example/domain/entities/trade_entity.dart';

part 'trade_model.g.dart';

@JsonSerializable()
class TradeModel {
  @JsonKey(name: 'e')
  final EventType eventType;
  @JsonKey(name: 'E')
  final int eventTime;
  @JsonKey(name: 's')
  final String symbol;
  @JsonKey(name: 't')
  final int tradeId;
  @JsonKey(name: 'p')
  final String price;
  @JsonKey(name: 'q')
  final String quantity;
  @JsonKey(name: 'T')
  final int tradeTime;
  @JsonKey(name: 'm')
  final bool isBuyerMaker;
  @JsonKey(name: 'M')
  final bool isBestPriceMatch;

  TradeModel({
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

  factory TradeModel.fromJson(Map<String, dynamic> json) =>
      _$TradeModelFromJson(json);

  Map<String, dynamic> toJson() => _$TradeModelToJson(this);

  TradeEntity toEntity() {
    return TradeEntity(
      eventType: eventType,
      eventTime: DateTime.fromMillisecondsSinceEpoch(eventTime),
      symbol: symbol,
      tradeId: tradeId,
      price: double.parse(price),
      quantity: double.parse(quantity),
      tradeTime: DateTime.fromMillisecondsSinceEpoch(tradeTime),
      isBuyerMaker: isBuyerMaker,
      isBestPriceMatch: isBestPriceMatch,
    );
  }
}

@JsonEnum()
enum EventType { trade, aggTrade, kline, ticker, bookTicker, depthUpdate }
