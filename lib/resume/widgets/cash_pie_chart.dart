import 'dart:math';

import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/ui/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

extension OrientationExtension on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
}

class CashPieChart extends StatelessWidget {
  const CashPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    if (!context.isPortrait) {
      return const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _Legend(),
          Gap(10),
          _Chart(),
        ],
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Legend(),
        LayoutBuilder(builder: (context, constraints) {
          bool isTablet = false;
          final height = MediaQuery.of(context).size.height;
          if (height >= 900) {
            isTablet = true;
          }
          return _Chart(isTablet: isTablet);
        }),
      ],
    );
  }
}

class _Legend extends StatelessWidget {
  const _Legend();

  @override
  Widget build(BuildContext context) {
    return ChartLegend(alignment: MainAxisAlignment.center, indicatorList: [
      const Gap(50.0),
      const Indicator(color: blackChart, text: 'Left'),
      const Gap(20.0),
      Indicator(color: violetChart, text: 'In progress'),
      const Gap(20.0),
      Indicator(color: greenChart, text: 'Done')
    ]);
  }
}

class _Chart extends StatelessWidget {
  const _Chart({
    this.isTablet,
  });

  final bool? isTablet;
  double getChartDimensions() {
    if (isTablet == null) return 270;
    return isTablet! ? 270 : 165;
  }

  @override
  Widget build(BuildContext context) {
    final dimensions = getChartDimensions();
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.only(left: 10.0),
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      height: dimensions,
      width: dimensions,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0).copyWith(right: 20.0),
            child: PieChart(
              PieChartData(
                  // read about it in the PieChartData section

                  sections: [
                    PieChartSectionData(
                        value: 18,
                        color: violetChart,
                        titleStyle: context.theme.titleSmall
                            ?.copyWith(color: Colors.black)),
                    PieChartSectionData(
                        value: 10,
                        color: blackChart,
                        titleStyle: context.theme.titleSmall
                            ?.copyWith(color: Colors.white)),
                    PieChartSectionData(
                        value: 25,
                        color: greenChart,
                        titleStyle: context.theme.titleSmall
                            ?.copyWith(color: Colors.black)),
                  ]),

              swapAnimationDuration:
                  const Duration(milliseconds: 150), // Optional
              swapAnimationCurve: Curves.linear, // Optional
            ),
          ),
          const Positioned(bottom: 0, left: 0, child: Text('21%')),
          const Positioned(bottom: 0, right: 0, child: Text('34%')),
          const Positioned(top: 0, right: 0, child: Text('45%')),
          Positioned(
              top: 35,
              right: 17,
              child: Container(
                transform: Matrix4.rotationZ(-pi / 4),
                width: 22,
                height: 3,
                color: Colors.black,
              )),
          Positioned(
              bottom: 35,
              right: 13,
              child: Container(
                transform: Matrix4.rotationZ(pi / 4),
                width: 22,
                height: 3,
                color: Colors.black,
              )),
          Positioned(
              bottom: 19,
              left: 15,
              child: Container(
                transform: Matrix4.rotationZ(-pi / 4),
                width: 22,
                height: 3,
                color: Colors.black,
              )),
        ],
      ),
    );
  }
}

class ChartLegend extends StatelessWidget {
  const ChartLegend({super.key, required this.indicatorList, this.alignment});
  final List<Widget> indicatorList;
  final MainAxisAlignment? alignment;
  @override
  Widget build(BuildContext context) {
    if (!context.isPortrait) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: alignment ?? MainAxisAlignment.start,
        children: indicatorList,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: alignment ?? MainAxisAlignment.start,
      children: indicatorList,
    );
  }
}

class Indicator extends StatelessWidget {
  const Indicator(
      {super.key,
      required this.color,
      required this.text,
      this.textColor = Colors.black});

  final Color color;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: color,
        ),
        const Gap(10.0),
        Text(
          text,
          style: context.theme.bodyLarge?.copyWith(color: textColor),
        )
      ],
    );
  }
}
