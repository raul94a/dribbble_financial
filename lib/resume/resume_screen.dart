import 'package:dribbble_financial/resume/widgets/analytics.dart';
import 'package:dribbble_financial/resume/widgets/cash_pie_chart.dart';
import 'package:dribbble_financial/resume/widgets/credit_cards_section.dart';
import 'package:dribbble_financial/resume/widgets/financial_options_grid.dart';
import 'package:dribbble_financial/widgets/appbar.dart';
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
          Appbar(
            title: 'Dashboard',
            children: [
              Icon(Icons.notifications_none_rounded),
              Gap(40.0),
              Icon(Icons.toc_outlined)
            ],
          ),
          CreditCardSection(),
          DashboardFinancialOptions(),
          AnalyticsCard(chart: CashPieChart())
        ],
      ),
    );
  }
}
