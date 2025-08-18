import 'package:json_annotation/json_annotation.dart';
import 'package:websocket_example/data/models/event_type_enum.dart';
import 'package:websocket_example/domain/entities/ticker_entity_data.dart';

part 'ticker_model_data.g.dart';

@JsonSerializable()
class TickerModelData {
  @JsonKey(name: 'e')
  final EventType eventType;
  @JsonKey(name: 'E')
  final int eventTime;
  @JsonKey(name: 'c')
  final String currentPrice;
  @JsonKey(name: 'h')
  final String highFor24;
  @JsonKey(name: 'l')
  final String lowFor24;
  @JsonKey(name: 'P')
  final String changePercent;

  TickerModelData({
    required this.eventType,
    required this.eventTime,
    required this.currentPrice,
    required this.highFor24,
    required this.lowFor24,
    required this.changePercent,
  });

  factory TickerModelData.fromJson(Map<String, dynamic> json) =>
      _$TickerModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$TickerModelDataToJson(this);

  TickerEntityData toEntity() {
    return TickerEntityData(
      eventType: eventType,
      eventTime: eventTime,
      currentPrice: currentPrice,
      highFor24: highFor24,
      lowFor24: lowFor24,
      changePercent: changePercent,
    );
  }
}
