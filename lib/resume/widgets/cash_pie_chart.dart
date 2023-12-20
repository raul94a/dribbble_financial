import 'dart:math';

import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/ui/colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';



class CashPieChart extends StatelessWidget {
  const CashPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Gap(20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Analytics',
                style: context.theme.titleLarge,
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
            ],
          ),
          const Gap(10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChartLegend(alignment: MainAxisAlignment.center, indicatorList: [
                const Gap(50.0),
                const Indicator(color: blackChart, text: 'Left'),
                const Gap(20.0),
                Indicator(color: violetChart, text: 'In progress'),
                const Gap(20.0),
                Indicator(color: greenChart, text: 'Done')
              ]),
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.only(left: 10.0),
                height: 180,
                width: 180,
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
                                  radius: 40,
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
                        right: 25,
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
                        bottom: 20,
                        left: 20,
                        child: Container(
                          transform: Matrix4.rotationZ(-pi / 4),
                          width: 22,
                          height: 3,
                          color: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
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
