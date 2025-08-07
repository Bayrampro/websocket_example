import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websocket_example/core/constants/assets.dart';

class TradeCard extends StatelessWidget {
  const TradeCard({
    super.key,
    required this.symbol,
    required this.date,
    required this.price,
  });

  final String symbol;
  final String date;
  final double price;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(top: 33.0, left: 33.0, right: 33.0),
      child: Row(
        children: [
          Container(
            width: 57,
            height: 53,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            decoration: BoxDecoration(
              color: theme.hintColor,
              borderRadius: BorderRadius.circular(22),
            ),
            child: SvgPicture.asset(Assets.coinIcon),
          ),
          const SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(symbol, style: theme.textTheme.titleMedium),
              Text(
                date,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.hintColor,
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            "\$$price",
            style: theme.textTheme.titleMedium?.copyWith(
              color: theme.hintColor,
            ),
          ),
        ],
      ),
    );
  }
}
