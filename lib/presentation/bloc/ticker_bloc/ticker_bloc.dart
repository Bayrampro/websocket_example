import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/domain/entities/ticker_entity.dart';
import 'package:websocket_example/domain/repo/binance_repository.dart';

part 'ticker_event.dart';
part 'ticker_state.dart';

class TickerBloc extends Bloc<TickerEvent, TickerState> {
  final BinanceRepository<TickerEntity> _repo;
  final Talker _talkerLogger;

  TickerBloc(this._repo, this._talkerLogger) : super(TickerInitial()) {
    on<TickerStarted>(_onTickerStarted);
  }

  FutureOr<void> _onTickerStarted(
    TickerStarted event,
    Emitter<TickerState> emit,
  ) async {
    emit(TickerConnecting());
    try {
      _repo.subscribeTo(event.symbol);

      await emit.forEach(
        _repo.data,
        onData: (trade) => TickerReceived(ticker: trade),
        onError: (error, stackTrace) {
          _talkerLogger.error(
            "TickerBloc - _onTickerStarted",
            error,
            stackTrace,
          );
          return TickerError(message: "Error when fetching data...");
        },
      );
    } catch (error, stackTrace) {
      _talkerLogger.error("TickerBloc - _onTickerStarted", error, stackTrace);
      emit(TickerError(message: "Error when fetching data..."));
    }
    return null;
  }
}
