import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/domain/entities/trade_entity.dart';
import 'package:websocket_example/domain/repo/binance_repository.dart';

part 'trade_event.dart';
part 'trade_state.dart';

class TradeBloc extends Bloc<TradeEvent, TradeState> {
  final BinanceRepository _repo;
  final Talker _talkerLogger;

  TradeBloc(this._repo, this._talkerLogger) : super(TradeBlocInitial()) {
    on<TradeStarted>(_onTradeStarted);
  }

  FutureOr<void> _onTradeStarted(
    TradeStarted event,
    Emitter<TradeState> emit,
  ) async {
    emit(TradeConnecting());
    try {
      _repo.subscribeTo(event.symbol);

      await emit.forEach(
        _repo.data,
        onData: (trade) => TradeReceived(trade: trade),
        onError: (error, stackTrace) {
          _talkerLogger.error("TradeBloc - _onTradeStarted", error, stackTrace);
          return TradeError(message: "Error when fetching data...");
        },
      );
    } catch (error, stackTrace) {
      _talkerLogger.error("TradeBloc - _onTradeStarted", error, stackTrace);
      emit(TradeError(message: "Error when fetching data..."));
    }
  }
}
