import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/transactions.dart';
import './transaction_list_tile.dart';

class TransactionsSummary extends StatelessWidget {
  const TransactionsSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Center(
            child: Text(
              AppLocalizations.of(context)!.transactions,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
        ),
        const Divider(thickness: 1, color: Colors.black),
        SingleChildScrollView(
          child: SizedBox(
            height: 200,
            child:
                Consumer<Transactions>(builder: (context, transactions, child) {
              return ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    TransactionListTile(transactions[index]),
                    const Divider(),
                  ],
                ),
                itemCount: transactions.number,
              );
            }),
          ),
        ),
        const Divider(thickness: 1, color: Colors.black),
      ],
    );
  }
}
