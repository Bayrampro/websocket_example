import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websocket_example/core/constants/assets.dart';

class TickerCard extends StatelessWidget {
  const TickerCard({
    super.key,
    required this.currentPrice,
    required this.symbolIconPath,
    required this.highFor24,
    required this.lowFor24,
    required this.changePercent,
  });

  final String currentPrice;
  final String symbolIconPath;
  final String highFor24;
  final String lowFor24;
  final double changePercent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return SizedBox(
      width: mediaQuery.size.width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 5.0,
                children: [
                  Text('Current Price', style: theme.textTheme.titleLarge),
                  Text(
                    '\$$currentPrice',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ],
              ),
              Container(
                height: 169,
                width: 167,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainer,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: SvgPicture.asset(symbolIconPath),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                spacing: 5.0,
                children: [
                  Row(
                    spacing: 6.0,
                    children: [
                      SvgPicture.asset(Assets.linkArrowUpIcon),
                      Text(
                        'Highest price in 24h',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Text(
                    '\$$highFor24',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ],
              ),
              Column(
                spacing: 5.0,
                children: [
                  Row(
                    spacing: 6.0,
                    children: [
                      SvgPicture.asset(Assets.linkArrowDownIcon),
                      Text(
                        'Lowest price in 24h',
                        style: theme.textTheme.titleSmall,
                      ),
                    ],
                  ),
                  Text(
                    '\$$lowFor24',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.colorScheme.error,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 10.0),
        ],
      ),
    );
  }
}
