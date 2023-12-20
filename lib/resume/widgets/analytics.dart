import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Analytics extends StatelessWidget {
  const Analytics({required this.chart});
  final Widget chart;
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
          chart
        ],
      ),
    );
  }
}
