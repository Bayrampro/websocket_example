part of 'trade_bloc.dart';

abstract final class TradeBlocState extends Equatable {}

final class TradeBlocInitial extends TradeBlocState {
  @override
  List<Object?> get props => [];
}

// TradeConnecting, TradeConnected, TradeReceived, TradeError, TradeDisconnected

final class TradeConnecting extends TradeBlocState {
  @override
  List<Object?> get props => [];
}

final class TradeConnected extends TradeBlocState {
  @override
  List<Object?> get props => [];
}

final class TradeReceived extends TradeBlocState {
  final TradeEntity trade;

  TradeReceived({required this.trade});

  @override
  List<Object?> get props => [trade];
}

final class TradeError extends TradeBlocState {
  final String message;

  TradeError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class TradeDisconnected extends TradeBlocState {
  @override
  List<Object?> get props => [];
}
