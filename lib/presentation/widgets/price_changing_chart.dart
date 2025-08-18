import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:websocket_example/config/theme/app_colors.dart';

class PriceChangingChart extends StatefulWidget {
  const PriceChangingChart({
    super.key,
    required this.btcPercent,
    required this.ethPercent,
    required this.bnbPercent,
  });

  final double btcPercent;
  final double ethPercent;
  final double bnbPercent;

  @override
  State<StatefulWidget> createState() => PriceChangingChartState();
}

class PriceChangingChartState extends State<PriceChangingChart> {
  final double width = 7;

  late List<BarChartGroupData> rawBarGroups;
  late List<BarChartGroupData> showingBarGroups;

  int touchedGroupIndex = -1;

  @override
  void initState() {
    super.initState();
    final btcGroup = makeGroupData(0, widget.btcPercent);
    final ethGroup = makeGroupData(1, widget.ethPercent);
    final bnbGroup = makeGroupData(2, widget.bnbPercent);

    final items = [btcGroup, ethGroup, bnbGroup];

    rawBarGroups = items;

    showingBarGroups = rawBarGroups;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AspectRatio(
      aspectRatio: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                makeChartIcon(),
                const SizedBox(width: 38),
                Text(
                  'Price changing percent',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(height: 38),
            Expanded(
              child: BarChart(
                BarChartData(
                  maxY: 5,
                  minY: -5,
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: bottomTitles,
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 28,
                        interval: 1,
                        getTitlesWidget: leftTitles,
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: showingBarGroups,
                  gridData: const FlGridData(show: false),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        y: 0,
                        color: Theme.of(context).colorScheme.primaryContainer,
                        strokeWidth: 1,
                        dashArray: [10, 10],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    final theme = Theme.of(context);
    final style = TextStyle(
      color: theme.colorScheme.tertiary,
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );
    String text;
    if (value == -5) {
      text = '-5%';
    } else if (value == 5) {
      text = '5%';
    } else if (value == 0) {
      text = '0';
    } else {
      return Container();
    }
    return SideTitleWidget(
      meta: meta,
      space: 0,
      child: Row(children: [Text(text, style: style)]),
    );
  }

  Widget bottomTitles(double value, TitleMeta meta) {
    final titles = <String>['BTC', 'ETH', 'BNB'];
    final theme = Theme.of(context);

    final Widget text = Text(
      titles[value.toInt()],
      style: TextStyle(
        color: theme.colorScheme.tertiary,
        fontWeight: FontWeight.bold,
        fontSize: 14,
      ),
    );

    return SideTitleWidget(meta: meta, space: 16, child: text);
  }

  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      barsSpace: 4,
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y < 0 ? AppColors.error : AppColors.blueButton,
          width: width,
        ),
      ],
    );
  }

  Widget makeChartIcon() {
    const width = 4.5;
    const space = 3.5;
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: width,
          height: 10,
          color: theme.colorScheme.primaryContainer,
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 28,
          color: theme.colorScheme.primaryContainer,
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 42,
          color: theme.colorScheme.primaryContainer,
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 28,
          color: theme.colorScheme.primaryContainer,
        ),
        const SizedBox(width: space),
        Container(
          width: width,
          height: 10,
          color: theme.colorScheme.primaryContainer,
        ),
      ],
    );
  }
}
