import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/widgets/dotted_money_text_span.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class MonthlyComparisonBarChart extends StatelessWidget {
  const MonthlyComparisonBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    const income = 17888.55;
    const outcome = 12888.31;
    return const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FinancialActivityResume(
              title: 'Total Income',
              quantity: income,
              color: Colors.black,
            ),
            FinancialActivityResume(
              title: 'Total Outcome',
              quantity: outcome,
              color: Colors.grey,
            ),
          ],
        ),
        Gap(20),
        AspectRatio(
          aspectRatio: 1.5,
          child: _Chart(),
        ),
      ],
    );
  }
}

class FinancialActivityResume extends StatelessWidget {
  const FinancialActivityResume(
      {super.key,
      required this.title,
      required this.quantity,
      required this.color});

  final String title;
  final double quantity;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.circle,
          color: color,
          size: 20,
        ),
        const Gap(10),
        Column(
          children: [
            Text(
              title,
              style: context.theme.bodyMedium
                  ?.copyWith(color: const Color.fromARGB(255, 54, 54, 54)),
            ),
            const Gap(2.5),
            DottedMoneyTextSpan(quantity: quantity)
          ],
        )
      ],
    );
  }
}

class _Chart extends StatefulWidget {
  const _Chart({
    super.key,
  });

  @override
  State<_Chart> createState() => _ChartState();
}

class _ChartState extends State<_Chart> {
  final double width = 35.0;
  BarChartGroupData makeGroupData(int x, double y1, double y2) {
    final leftBarColor =
        x == 2 ? const Color.fromARGB(219, 133, 128, 198) : Colors.black;
    return BarChartGroupData(
      showingTooltipIndicators: [],
      barsSpace: 5,
      x: x,
      barRods: [
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: y1,
          color: leftBarColor,
          width: width,
        ),
        BarChartRodData(
          borderRadius: BorderRadius.circular(6),
          toY: y2,
          color: Colors.grey,
          width: width,
        ),
      ],
    );
  }

  List<BarChartGroupData> barGroups = [];
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final barGroup1 = makeGroupData(0, 5 * 1000, 12 * 1000);
    final barGroup2 = makeGroupData(1, 16 * 1000, 12 * 1000);
    final barGroup3 = makeGroupData(2, 18 * 1000, 15 * 1000);
    final barGroup4 = makeGroupData(3, 8 * 1000, 12 * 1000);

    final items = [
      barGroup1,
      barGroup2,
      barGroup3,
      barGroup4,
    ];
    setState(() {
      barGroups = items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: BarChart(
        BarChartData(
            barTouchData: BarTouchData(
                touchTooltipData:
                    BarTouchTooltipData(tooltipBgColor: Colors.white)),
            barGroups: barGroups,
            gridData: const FlGridData(show: false),
            borderData: FlBorderData(show: false),
            titlesData: _getTitlesData()),
      ),
    );
  }

  FlTitlesData _getTitlesData() {
    return FlTitlesData(
      topTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      rightTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      leftTitles: const AxisTitles(
        sideTitles: SideTitles(showTitles: false),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          reservedSize: 30,
          getTitlesWidget: _getBottomTitles,
        ),
      ),
    );
  }

  Widget _getBottomTitles(value, meta) {
    Widget wrapWithPadding(EdgeInsets insets, Widget child) {
      return Padding(
        padding: insets,
        child: child,
      );
    }

    return switch (value) {
      0 => wrapWithPadding(
          const EdgeInsets.only(top: 10),
          Text(
            'June',
            style: context.theme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 38, 39, 39)),
          ),
        ),
      1 => wrapWithPadding(
          const EdgeInsets.only(top: 10),
          Text(
            'July',
            style: context.theme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 38, 39, 39)),
          ),
        ),
      2 => wrapWithPadding(
          const EdgeInsets.only(top: 10),
          Text(
            'August',
            style: context.theme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 38, 39, 39)),
          ),
        ),
      _ => wrapWithPadding(
          const EdgeInsets.only(top: 10),
          Text(
            'September',
            style: context.theme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color.fromARGB(255, 38, 39, 39)),
          ),
        ),
    };
  }
}
