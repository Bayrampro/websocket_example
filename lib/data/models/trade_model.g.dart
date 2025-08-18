// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TradeModel _$TradeModelFromJson(Map<String, dynamic> json) => TradeModel(
  eventType: $enumDecode(_$EventTypeEnumMap, json['e']),
  eventTime: (json['E'] as num).toInt(),
  symbol: json['s'] as String,
  tradeId: (json['t'] as num).toInt(),
  price: json['p'] as String,
  quantity: json['q'] as String,
  tradeTime: (json['T'] as num).toInt(),
  isBuyerMaker: json['m'] as bool,
  isBestPriceMatch: json['M'] as bool,
);

Map<String, dynamic> _$TradeModelToJson(TradeModel instance) =>
    <String, dynamic>{
      'e': _$EventTypeEnumMap[instance.eventType]!,
      'E': instance.eventTime,
      's': instance.symbol,
      't': instance.tradeId,
      'p': instance.price,
      'q': instance.quantity,
      'T': instance.tradeTime,
      'm': instance.isBuyerMaker,
      'M': instance.isBestPriceMatch,
    };

const _$EventTypeEnumMap = {
  EventType.trade: 'trade',
  EventType.aggTrade: 'aggTrade',
  EventType.kline: 'kline',
  EventType.ticker: '24hrTicker',
  EventType.bookTicker: 'bookTicker',
  EventType.depthUpdate: 'depthUpdate',
};
