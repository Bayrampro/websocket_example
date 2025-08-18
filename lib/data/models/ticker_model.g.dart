// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickerModel _$TickerModelFromJson(Map<String, dynamic> json) => TickerModel(
  stream: json['stream'] as String,
  data: TickerModelData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TickerModelToJson(TickerModel instance) =>
    <String, dynamic>{'stream': instance.stream, 'data': instance.data};
