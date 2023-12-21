import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/core/extensions/num_extension.dart';
import 'package:flutter/material.dart';

class DottedMoneyTextSpan extends StatelessWidget {
  const DottedMoneyTextSpan({super.key, required this.quantity});
  final double quantity;
  @override
  Widget build(BuildContext context) {
    return Text.rich(getTextSpanMoney(quantity, context));
  }

  TextSpan getTextSpanMoney(num qty, BuildContext context) {
    final fullPart = qty.toInt().toStringDotted();

    var decimal = qty.toStringAsFixed(2);
    final indexOfPoint = decimal.indexOf('.');
    decimal = decimal.substring(indexOfPoint);
    return TextSpan(children: [
      TextSpan(text: '\$', style: context.theme.titleMedium),
      TextSpan(text: fullPart, style: context.theme.titleMedium),
      TextSpan(
          text: decimal,
          style: context.theme.titleSmall
              ?.copyWith(color: const Color.fromARGB(255, 80, 80, 80)))
    ]);
  }
}
