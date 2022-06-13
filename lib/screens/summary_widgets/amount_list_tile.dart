import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../models/fellow.dart';
import '../../providers/transactions.dart';

class AmountListTile extends StatelessWidget {
  const AmountListTile(this.member, {Key? key}) : super(key: key);
  final Fellow member;

  @override
  Widget build(BuildContext context) {
    final transactions = Provider.of<Transactions>(context, listen: false);
    final balance = transactions.balance(member.id);
    final numberTransactions = transactions.numberOfTransactions(member.id);

    final text = AppLocalizations.of(context)!;
    final amountWithCent = (balance.abs() / 100).toStringAsFixed(2);

    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(member.avatarUrl)),
      title: Text(
        member.fullName,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(numberTransactions == 0
          ? text.haveMade0Transaction
          : numberTransactions == 1
              ? text.haveMade1Transaction
              : text.haveMadeXTransactions(numberTransactions.toString())),
      trailing: SizedBox(
        width: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${text.balance}${text.colon} ',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.normal)),
            Text(
              balance < 0
                  ? '(${text.dollarAmount(amountWithCent)})'
                  : text.dollarAmount(amountWithCent),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: balance < 0 ? Colors.red : Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
