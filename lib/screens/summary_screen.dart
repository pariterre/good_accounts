import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import './summary_widgets/amount_summary.dart';
import './summary_widgets/transactions_summary.dart';
import '../providers/party.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  var first = true;

  @override
  void initState() {
    super.initState();
    if (first) {
      Party().initializeWithDummy();
      first = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.goodAccountsMakeGoodFriends),
      ),
      body: const Summary(),
    );
  }
}

class Summary extends StatelessWidget {
  const Summary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            AmountSummary(),
            TransactionsSummary(),
          ],
        ),
      ),
    );
  }
}
