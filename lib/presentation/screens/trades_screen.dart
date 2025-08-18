import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:websocket_example/presentation/bloc/trade_bloc/trade_bloc.dart';
import 'package:websocket_example/presentation/widgets/app_bar_wrapped_body/app_bar_wrapped_body.dart';
import 'package:websocket_example/presentation/widgets/trade_card.dart';
import 'package:websocket_example/presentation/widgets/trade_header_widget.dart';

class TradesScreen extends StatefulWidget {
  const TradesScreen({super.key});

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen> {
  final List<TradeCard> _trades = [];

  @override
  void initState() {
    super.initState();
    context.read<TradeBloc>().add(TradeStarted(symbol: 'btcusdt'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TradeBloc, TradeState>(
      listener: (context, state) {
        if (state is TradeReceived) {
          if (_trades.length > 100) {
            _trades.removeAt(_trades.length - 2);
          }
          _trades.insert(
            0,
            TradeCard(
              key: ValueKey('trade_${state.trade.tradeId}'),
              symbol: state.trade.symbol,
              date: DateFormat.yMMMMEEEEd().format(state.trade.tradeTime),
              price: state.trade.price,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is TradeConnecting) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TradeError) {
          return Center(child: Text('Ошибка: ${state.message}'));
        }

        return AppBarWrappedBody(
          title: 'Трейды',
          headerWidget: const TradeHeaderWidget(),
          body: [..._trades, const SizedBox(height: 110)],
        );
      },
    );
  }
}
