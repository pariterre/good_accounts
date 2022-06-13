import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/transaction.dart';

class TransactionListTile extends StatelessWidget {
  const TransactionListTile(this.transaction, {Key? key}) : super(key: key);
  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    final text = AppLocalizations.of(context)!;
    final toNames = transaction.toFullNames.join(',\n');

    return ListTile(
      title: Row(
        children: [
          Text(
            transaction.from.fullName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
      subtitle: Text('${text.burrowedTo}${text.colon}\n$toNames'),
      trailing: SizedBox(
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              text.dollarAmount((transaction.amount / 100).toStringAsFixed(2)),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
