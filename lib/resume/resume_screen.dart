import 'package:dribbble_financial/resume/widgets/analytics.dart';
import 'package:dribbble_financial/resume/widgets/appbar.dart';
import 'package:dribbble_financial/resume/widgets/cash_pie_chart.dart';
import 'package:dribbble_financial/resume/widgets/financial_options_grid.dart';
import 'package:flutter/material.dart';

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
          DashboardFinancialOptions(),
          AnalyticsCard(chart: CashPieChart())
        ],
      ),
    );
  }
}
