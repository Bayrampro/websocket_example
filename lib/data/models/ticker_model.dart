import 'package:json_annotation/json_annotation.dart';
import 'package:websocket_example/data/models/ticker_model_data.dart';
import 'package:websocket_example/domain/entities/ticker_entity.dart';

part 'ticker_model.g.dart';

@JsonSerializable()
class TickerModel {
  final String stream;
  final TickerModelData data;

  TickerModel({required this.stream, required this.data});

  factory TickerModel.fromJson(Map<String, dynamic> json) =>
      _$TickerModelFromJson(json);

  Map<String, dynamic> toJson() => _$TickerModelToJson(this);

  TickerEntity toEntity() {
    return TickerEntity(stream: stream, data: data.toEntity());
  }
}
