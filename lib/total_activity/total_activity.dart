import 'package:dribbble_financial/total_activity/model/transfer_model.dart';
import 'package:dribbble_financial/total_activity/widgets/bar_charts.dart';
import 'package:dribbble_financial/total_activity/widgets/transfers.dart';
import 'package:dribbble_financial/widgets/appbar.dart';
import 'package:flutter/material.dart';

final now = DateTime.now();
final transfers = [
  TransferModel(
      sentTo: 'SIEMENS',
      subject: 'Netflix Subscription',
      status: TransferStatus.completed,
      date: now),
  TransferModel(
    sentTo: 'ADB OPS',
    subject: 'Stock Operation',
    status: TransferStatus.inProgress,
    date: now.subtract(
      const Duration(minutes: 5),
    ),
  ),
  TransferModel(
    sentTo: 'Mike Towers',
    subject: 'Mercadona',
    status: TransferStatus.declined,
    date: now.subtract(
      const Duration(minutes: 19),
    ),
  ),
  TransferModel(
    sentTo: 'Gente de Zona',
    subject: 'Bizum',
    status: TransferStatus.completed,
    date: now.subtract(
      const Duration(minutes: 66),
    ),
  ),
  TransferModel(
    sentTo: 'Raul94a',
    subject: 'Dividend',
    status: TransferStatus.completed,
    date: now.subtract(
      const Duration(minutes: 500),
    ),
  ),
  TransferModel(
    sentTo: 'Unicaja',
    subject: 'Power bill',
    status: TransferStatus.declined,
    date: now.subtract(
      const Duration(minutes: 1000),
    ),
  ),
];

class TotalActivityScreen extends StatelessWidget {
  const TotalActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transferss = [...transfers, ...transfers];
    return SingleChildScrollView(
      child: Column(
        children: [
          const Appbar(
            title: 'Total Activity',
            children: [
              Icon(Icons.launch_rounded),
            ],
          ),
          const MonthlyComparisonBarChart(),
          TransfersListViewBuilder(transferss: transferss),
        ],
      ),
    );
  }
}

