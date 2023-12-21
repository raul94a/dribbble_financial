import 'dart:convert';

import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/main.dart';
import 'package:dribbble_financial/resume/widgets/analytics.dart';
import 'package:dribbble_financial/resume/widgets/appbar.dart';
import 'package:dribbble_financial/resume/widgets/cash_pie_chart.dart';
import 'package:dribbble_financial/resume/widgets/financial_options_grid.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ResumeScreen extends StatelessWidget {
  const ResumeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          Appbar(),
          BuyCards(),
          DashboardFinancialOptions(),
          AnalyticsCard(chart: CashPieChart())
        ],
      ),
    );
  }
}

class BuyCards extends StatelessWidget {
  const BuyCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color.fromARGB(255, 241, 238, 238),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0)
                    .copyWith(left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cards',
                  style: context.theme.titleMedium,
                ),
                const Row(
                  children: [
                    IconButton(
                        onPressed: null, icon: Icon(Icons.settings_outlined)),
                    IconButton(
                        onPressed: null, icon: Icon(Icons.arrow_back_ios)),
                  ],
                )
              ],
            ),
          ),
          const BuyCard(),
          const BalanceCard()
        ],
      ),
    );
  }
}

class BalanceCard extends StatelessWidget {
  const BalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,bottom: 20),
      width: BuyCard.cardWidth - 40,
      padding: const EdgeInsets.all(8.0).copyWith(left: 20,right: 20.0,top: 20,bottom: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your balance',
            style: context.theme.bodyMedium?.copyWith(color: const Color.fromARGB(255, 99, 98, 98),fontSize: 16),
          ),
          const Gap(10),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$120.456,00'),
              Row(
                children: [
                  PercentageRow(
                    rate: 16.60,
                  ),
                  Gap(10),
                  PercentageRow(rate: -10.30)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class PercentageRow extends StatelessWidget {
  const PercentageRow({super.key, required this.rate});
  final double rate;

  @override
  Widget build(BuildContext context) {
    bool isNegative = rate.isNegative;
    return Row(
      children: [
        Icon(
          isNegative ? Icons.arrow_downward : Icons.arrow_upward,
          color: isNegative ? Colors.red : Colors.green,
        ),
        const Gap(5.0),
        Text(
          '${rate.abs()}%',
          style: context.theme.bodyMedium?.copyWith(
            color: isNegative ? Colors.red : Colors.green,
          ),
        )
      ],
    );
  }
}

class BuyCard extends StatelessWidget {
  const BuyCard({
    super.key,
  });
  static const cardHeight = 220.0;
  static const cardWidth = 450.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        color: Colors.black,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                height: cardHeight,
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.credit_card,
                          size: 60,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        Text(
                          'Obisoft',
                          style: context.theme.bodyLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Text(
                      '**** **** **** 7865',
                      style: context.theme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w700),
                    ),
                    const Gap(20),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                        text: 'Jeremy Toe  ',
                        style: context.theme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: '12/24',
                        style: context.theme.bodyMedium?.copyWith(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ])),
                    const Gap(20)
                  ],
                ),
              ),
            ),
            Container(
                alignment: Alignment.topCenter,
                decoration: const BoxDecoration(
                    color: selectedColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0))),
                height: cardHeight,
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 20.0),
                child: const Icon(
                  Icons.contactless_outlined,
                  size: 40,
                )),
          ],
        ),
      ),
    );
  }
}
