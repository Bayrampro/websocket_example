import 'package:websocket_example/data/models/event_type_enum.dart';
import 'package:websocket_example/data/models/ticker_model_data.dart';

class TickerEntityData {
  final EventType eventType;
  final int eventTime;
  final String currentPrice;
  final String highFor24;
  final String lowFor24;
  final String changePercent;

  TickerEntityData({
    required this.eventType,
    required this.eventTime,
    required this.currentPrice,
    required this.highFor24,
    required this.lowFor24,
    required this.changePercent,
  });

  TickerModelData toModel() {
    return TickerModelData(
      eventType: eventType,
      eventTime: eventTime,
      currentPrice: currentPrice,
      highFor24: highFor24,
      lowFor24: lowFor24,
      changePercent: changePercent,
    );
  }
}
