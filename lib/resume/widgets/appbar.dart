
import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(kToolbarHeight),
        Row(
          children: [
            const Gap(30.0),
            Text(
              'Dashboard',
              style: context.theme.titleLarge,
            ),
            const Gap(60),
            const Icon(Icons.notifications_none_rounded),
            const Gap(40.0),
            const Icon(Icons.toc_outlined)
          ],
        ),
        const Gap(kToolbarHeight - 10.0),
      ],
    );
  }
}

