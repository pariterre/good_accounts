import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../providers/party.dart';
import 'amount_list_tile.dart';

class AmountSummary extends StatelessWidget {
  const AmountSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(top: 12.0),
          child: Center(
            child: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.secondary),
              child: Text(
                AppLocalizations.of(context)!.summary,
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
        ),
        SingleChildScrollView(
          child: SizedBox(
            height: 200,
            child: Consumer<Party>(builder: (context1, party, child1) {
              return ListView.builder(
                itemBuilder: (context3, index) => Column(
                  children: [
                    AmountListTile(party[index]),
                    const Divider(),
                  ],
                ),
                itemCount: party.size,
              );
            }),
          ),
        ),
        const SizedBox(height: 25),
      ],
    );
  }
}
