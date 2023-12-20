import 'package:flutter/material.dart' show IconData,Icons;

class FinancialItem {
  final IconData iconData;
  final String title;
  final num money;
  FinancialItem({
    required this.iconData,
    required this.title,
    required this.money,
  });
  static List<FinancialItem> generateList() {
    return [
      FinancialItem(
          iconData: Icons.wallet_outlined, title: 'Income', money: 68657.00),
      FinancialItem(
          iconData: Icons.wallet_outlined,
          title: 'Down Payment',
          money: 10000.00),
      FinancialItem(
          iconData: Icons.wallet_outlined, title: 'Complete', money: 18657.00),
      FinancialItem(
          iconData: Icons.account_balance_wallet_outlined,
          title: 'New reviews',
          money: 6667.00),
    ];
  }
}
