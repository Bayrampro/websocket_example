part of 'trade_bloc.dart';

sealed class TradeState extends Equatable {}

final class TradeBlocInitial extends TradeState {
  @override
  List<Object?> get props => [];
}

// TradeConnecting, TradeConnected, TradeReceived, TradeError, TradeDisconnected

final class TradeConnecting extends TradeState {
  @override
  List<Object?> get props => [];
}

final class TradeConnected extends TradeState {
  @override
  List<Object?> get props => [];
}

final class TradeReceived extends TradeState {
  final TradeEntity trade;

  TradeReceived({required this.trade});

  @override
  List<Object?> get props => [trade];
}

final class TradeError extends TradeState {
  final String message;

  TradeError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class TradeDisconnected extends TradeState {
  @override
  List<Object?> get props => [];
}
