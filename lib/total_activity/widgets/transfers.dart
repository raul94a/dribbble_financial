import 'package:dribbble_financial/core/extensions/context_extensions.dart';
import 'package:dribbble_financial/total_activity/model/transfer_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TransfersListViewBuilder extends StatelessWidget {
  const TransfersListViewBuilder({
    super.key,
    required this.transferss,
  });

  final List<TransferModel> transferss;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxHeight: 800),
      child: ListView.separated(
          separatorBuilder: (context, index) => const Divider(),
          physics: const NeverScrollableScrollPhysics(),
          primary: false,
          itemCount: transferss.length,
          itemBuilder: (ctx, i) {
            final transfer = transferss[i];
            return TransferItem(transfer: transfer);
          }),
    );
  }
}

class TransferItem extends StatelessWidget {
  const TransferItem({super.key, required this.transfer});
  final TransferModel transfer;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.money),
      ),
      title: Text(
        transfer.subject,
        style: context.theme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Text(
          transfer.sentTo,
          style: context.theme.bodyMedium?.copyWith(),
        ),
      ),
      dense: false,
      trailing: FittedBox(
        fit: BoxFit.fitWidth,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              transfer.getStatus(),
              style: context.theme.bodyMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                FittedBox(
                    alignment: Alignment.centerLeft,
                    child: getTransferStatusIcon()),
                const Gap(10),
                Text(transfer.getFormattedDate(),
                    style: context.theme.bodySmall),
              ],
            )
          ],
        ),
      ),
    );
  }

  Icon getTransferStatusIcon() {
    switch (transfer.status) {
      case TransferStatus.completed:
        return const Icon(
          Icons.check,
          color: Color.fromARGB(255, 40, 130, 91),
        );
      case TransferStatus.inProgress:
        return const Icon(
          Icons.sync,
          color: Color.fromARGB(255, 196, 138, 64),
        );
      case TransferStatus.declined:
        return const Icon(
          Icons.cancel_outlined,
          color: Color.fromARGB(255, 185, 42, 32),
        );
    }
  }
}
