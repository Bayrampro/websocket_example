part of 'trade_bloc.dart';

sealed class TradeEvent extends Equatable {}

// TradeStarted, TradeStopped

final class TradeStarted extends TradeEvent {
  final String symbol;

  TradeStarted({required this.symbol});

  @override
  List<Object?> get props => [symbol];
}

final class TradeStopped extends TradeEvent {
  @override
  List<Object?> get props => [];
}
