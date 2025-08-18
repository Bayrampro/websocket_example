part of 'ticker_bloc.dart';

sealed class TickerState extends Equatable {}

final class TickerInitial extends TickerState {
  @override
  List<Object?> get props => [];
}

// TickerConnecting, TickerConnected, TickerReceived, TickerError, TickerDisconnected

final class TickerConnecting extends TickerState {
  @override
  List<Object?> get props => [];
}

final class TickerConnected extends TickerState {
  @override
  List<Object?> get props => [];
}

final class TickerReceived extends TickerState {
  final TickerEntity ticker;

  TickerReceived({required this.ticker});

  @override
  List<Object?> get props => [ticker];
}

final class TickerError extends TickerState {
  final String message;

  TickerError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class TickerDisconnected extends TickerState {
  @override
  List<Object?> get props => [];
}
