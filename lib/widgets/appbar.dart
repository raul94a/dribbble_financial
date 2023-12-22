import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key, required this.title, required this.children});
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        children: [
          const Gap(kToolbarHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: context.theme.titleLarge,
              ),
              Row(
                children: children,
              )
            ],
          ),
          const Gap(kToolbarHeight - 10.0),
        ],
      ),
    );
  }
}
