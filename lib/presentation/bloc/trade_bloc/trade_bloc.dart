import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_example/domain/entities/trade_entity.dart';
import 'package:websocket_example/domain/repo/trade_repository.dart';

part 'trade_event.dart';
part 'trade_state.dart';

class TradeBloc extends Bloc<TradeBlocEvent, TradeBlocState> {
  final TradeRepository _repo;

  TradeBloc(this._repo) : super(TradeBlocInitial()) {
    on<TradeStarted>(_onTradeStarted);
  }

  FutureOr<void> _onTradeStarted(
    TradeStarted event,
    Emitter<TradeBlocState> emit,
  ) async {
    emit(TradeConnecting());
    try {
      _repo.subscribeToTrades(event.symbol);

      await emit.forEach(
        _repo.trades,
        onData: (trade) => TradeReceived(trade: trade),
        onError: (error, stackTrace) {
          return TradeError(message: "");
        },
      );
    } catch (e) {
      emit(TradeError(message: ""));
    }
  }
}
