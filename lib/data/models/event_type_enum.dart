import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum EventType {
  trade,
  aggTrade,
  kline,
  @JsonValue('24hrTicker')
  ticker,
  bookTicker,
  depthUpdate,
}
