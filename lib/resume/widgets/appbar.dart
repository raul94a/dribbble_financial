import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

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
                'Dashboard',
                style: context.theme.titleLarge,
              ),
              const Row(
                children: [
                  Icon(Icons.notifications_none_rounded),
                  Gap(40.0),
                  Icon(Icons.toc_outlined)
                ],
              )
            ],
          ),
          const Gap(kToolbarHeight - 10.0),
        ],
      ),
    );
  }
}
