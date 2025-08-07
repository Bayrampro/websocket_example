part of 'trade_bloc.dart';

abstract final class TradeBlocEvent extends Equatable {}

// TradeStarted, TradeStopped

final class TradeStarted extends TradeBlocEvent {
  final String symbol;

  TradeStarted({required this.symbol});

  @override
  List<Object?> get props => [symbol];
}

final class TradeStopped extends TradeBlocEvent {
  final String symbol;

  TradeStopped({required this.symbol});

  @override
  List<Object?> get props => [symbol];
}
