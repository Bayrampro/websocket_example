part of 'ticker_bloc.dart';

// TickerStarted, TickerStopped

sealed class TickerEvent extends Equatable {}

final class TickerStarted extends TickerEvent {
  final String symbol;

  TickerStarted({required this.symbol});

  @override
  List<Object?> get props => [symbol];
}

final class TickerStopped extends TickerEvent {
  @override
  List<Object?> get props => [];
}
