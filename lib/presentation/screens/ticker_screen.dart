import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:websocket_example/core/utils/utils.dart';
import 'package:websocket_example/domain/entities/ticker_entity.dart';
import 'package:websocket_example/presentation/bloc/ticker_bloc/ticker_bloc.dart';
import 'package:websocket_example/presentation/providers/price_change_notifier.dart';
import 'package:websocket_example/presentation/widgets/app_bar_wrapped_body/app_bar_wrapped_body.dart';
import 'package:websocket_example/presentation/widgets/price_changing_chart.dart';
import 'package:websocket_example/presentation/widgets/ticker_card.dart';

class TickerScreen extends StatefulWidget {
  const TickerScreen({super.key});

  @override
  State<TickerScreen> createState() => _TickerScreenState();
}

class _TickerScreenState extends State<TickerScreen> {
  final Map<String, TickerCard> _cards = {};
  final PercentChangeNotifier notifier = PercentChangeNotifier();

  @override
  void initState() {
    super.initState();
    context.read<TickerBloc>().add(
      TickerStarted(symbol: 'btcusdt@ticker/ethusdt@ticker/bnbusdt@ticker'),
    );
  }

  void _onTickerReceived(TickerReceived state) {
    final ticker = state.ticker;
    _workWith(ticker, 'btcusdt@ticker');
    _workWith(ticker, 'ethusdt@ticker');
    _workWith(ticker, 'bnbusdt@ticker');
    notifier.update(
      ticker.stream,
      double.tryParse(ticker.data.changePercent) ?? 0.0,
    );
  }

  void _workWith(TickerEntity ticker, String symbolForCompare) {
    if (ticker.stream == symbolForCompare) {
      if (_cards.containsKey(ticker.stream)) {
        _updateCard(ticker);
      } else {
        _addCard(ticker);
      }
    }
  }

  void _updateCard(TickerEntity ticker) {
    _cards.update(
      ticker.stream,
      (card) => TickerCard(
        key: ValueKey(ticker.stream),
        currentPrice: double.parse(ticker.data.currentPrice).toStringAsFixed(2),
        symbolIconPath: Utils.getCoinIcon(ticker.stream),
        highFor24: double.parse(ticker.data.highFor24).toStringAsFixed(2),
        lowFor24: double.parse(ticker.data.lowFor24).toStringAsFixed(2),
        changePercent: double.parse(ticker.data.changePercent),
      ),
    );
  }

  void _addCard(TickerEntity ticker) {
    _cards.addAll({
      ticker.stream: TickerCard(
        key: ValueKey(ticker.stream),
        currentPrice: double.parse(ticker.data.currentPrice).toStringAsFixed(2),
        symbolIconPath: Utils.getCoinIcon(ticker.stream),
        highFor24: double.parse(ticker.data.highFor24).toStringAsFixed(2),
        lowFor24: double.parse(ticker.data.lowFor24).toStringAsFixed(2),
        changePercent: double.parse(ticker.data.changePercent),
      ),
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocConsumer<TickerBloc, TickerState>(
      listener: (context, state) {
        if (state is TickerReceived) {
          _onTickerReceived(state);
        }
      },
      builder: (context, state) {
        if (state is TickerReceived) {
          return AppBarWrappedBody(
            title: 'Home',
            headerWidget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 60,
                  top: 50,
                  left: 30,
                  right: 30,
                ),
                child: Card(
                  color: theme.colorScheme.secondaryContainer,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: AnimatedBuilder(
                    animation: notifier,
                    builder: (context, _) {
                      return PriceChangingChart(
                        key: UniqueKey(),
                        btcPercent: notifier.btc,
                        ethPercent: notifier.eth,
                        bnbPercent: notifier.bnb,
                      );
                    },
                  ),
                ),
              ),
            ),
            headerExpandedHeight: 0.40,
            body: [
              ..._cards.values.map((card) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: card,
                );
              }),
              const SizedBox(height: 130),
            ],
          );
        } else if (state is TickerError) {
          return Center(child: Text('Ошибка: ${state.message}'));
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
