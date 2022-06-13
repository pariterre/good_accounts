import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'screens/summary_screen.dart';
import './providers/party.dart';
import './providers/transactions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final party = Party()..initializeWithDummy();
    final transactions = Transactions()..initializeWithDummy(party);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => party),
        ChangeNotifierProvider(create: (context) => transactions),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SummaryScreen(),
      ),
    );
  }
}
