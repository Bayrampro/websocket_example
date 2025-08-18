import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websocket_example/core/constants/assets.dart';

class TradeHeaderWidget extends StatelessWidget {
  const TradeHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    return Container(
      color: theme.colorScheme.primaryContainer,
      width: mediaQuery.size.width,
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30.0,
              children: [
                Column(
                  children: [
                    Row(
                      spacing: 6.0,
                      children: [
                        SvgPicture.asset(Assets.linkArrowUpIcon),
                        Text(
                          'Total Balance',
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Text(
                      '\$7,783.00',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.surface,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 42,
                  width: 2,
                  color: theme.colorScheme.surface,
                ),
                Column(
                  children: [
                    Row(
                      spacing: 6.0,
                      children: [
                        SvgPicture.asset(Assets.linkArrowUpIcon),
                        Text(
                          'Total Expense',
                          style: theme.textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Text(
                      '-\$1.187.40',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 25),
            Stack(
              children: [
                Container(
                  width: 330,
                  height: 30,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 21.0,
                    vertical: 6.0,
                  ),
                  decoration: BoxDecoration(
                    color: theme.shadowColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    '30%',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.surface,
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    width: 330 * 0.7,
                    height: 30,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 21.0,
                      vertical: 6.0,
                    ),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Text(
                      '\$20,000.00',
                      style: theme.textTheme.titleSmall,
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10.0,
              children: [
                SvgPicture.asset(Assets.checkIcon),
                Text(
                  '30% of your expenses, looks good.',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
