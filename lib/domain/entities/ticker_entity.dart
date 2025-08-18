import 'package:websocket_example/data/models/ticker_model.dart';
import 'package:websocket_example/domain/entities/ticker_entity_data.dart';

class TickerEntity {
  final String stream;
  final TickerEntityData data;

  TickerEntity({required this.stream, required this.data});

  TickerModel toModel() {
    return TickerModel(stream: stream, data: data.toModel());
  }
}
