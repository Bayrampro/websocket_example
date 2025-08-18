// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_model_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickerModelData _$TickerModelDataFromJson(Map<String, dynamic> json) =>
    TickerModelData(
      eventType: $enumDecode(_$EventTypeEnumMap, json['e']),
      eventTime: (json['E'] as num).toInt(),
      currentPrice: json['c'] as String,
      highFor24: json['h'] as String,
      lowFor24: json['l'] as String,
      changePercent: json['P'] as String,
    );

Map<String, dynamic> _$TickerModelDataToJson(TickerModelData instance) =>
    <String, dynamic>{
      'e': _$EventTypeEnumMap[instance.eventType]!,
      'E': instance.eventTime,
      'c': instance.currentPrice,
      'h': instance.highFor24,
      'l': instance.lowFor24,
      'P': instance.changePercent,
    };

const _$EventTypeEnumMap = {
  EventType.trade: 'trade',
  EventType.aggTrade: 'aggTrade',
  EventType.kline: 'kline',
  EventType.ticker: '24hrTicker',
  EventType.bookTicker: 'bookTicker',
  EventType.depthUpdate: 'depthUpdate',
};
