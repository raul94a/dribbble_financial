import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/resume/models/financial_item.dart';
import 'package:dribbble_financial/widgets/dotted_money_text_span.dart';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

final financialList = FinancialItem.generateList();

class DashboardFinancialOptions extends StatelessWidget {
  const DashboardFinancialOptions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        shrinkWrap: true,
        primary: false,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 15.0,
            mainAxisExtent: 150.00,
            childAspectRatio: 2 / 2),
        itemBuilder: (ctx, index) {
          final item = financialList[index];
          return FinancialItemCard(
            financialItem: item,
            index: index,
          );
        });
  }
}

class FinancialItemCard extends StatelessWidget {
  const FinancialItemCard(
      {super.key, required this.financialItem, required this.index});
  final FinancialItem financialItem;

  final int index;

  bool get isFirstItem => index == 0;
  static const Color selectedColor = Color.fromARGB(255, 221, 208, 243);
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: const Color.fromARGB(255, 218, 208, 235),
      color: isFirstItem
          ? selectedColor
          : const Color.fromARGB(255, 243, 237, 253),
      elevation: 2.0,
      shadowColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Gap(10.0),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 60.0),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Card(
                    surfaceTintColor: const Color.fromARGB(255, 218, 208, 235),
                    color: selectedColor.withAlpha(80),
                    elevation: 1.0,
                    shadowColor: Colors.transparent,
                    child: Center(
                      child: Icon(financialItem.iconData),
                    ),
                  ),
                ),
              ),
              const Gap(10),
              Text(
                financialItem.title,
                style: context.theme.bodyLarge,
              ),
              const Gap(10),
              DottedMoneyTextSpan(quantity: financialItem.money.toDouble()),
              const Gap(10.0)
            ],
          ),
        ),
      ),
    );
  }

  
}



