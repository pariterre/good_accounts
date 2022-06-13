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
    final colorScheme = ColorScheme.fromSwatch(
        primarySwatch: Colors.green, accentColor: Colors.pink[400]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => party),
        ChangeNotifierProvider(create: (context) => transactions),
      ],
      child: MaterialApp(
        title: 'Good accounts make good friends',
        theme: ThemeData(
            colorScheme: colorScheme,
            fontFamily: 'Akrobat',
            textTheme: TextTheme(
              titleLarge: TextStyle(
                  fontWeight: FontWeight.bold, color: colorScheme.onSecondary),
              titleMedium: const TextStyle(fontWeight: FontWeight.bold),
              titleSmall: const TextStyle(fontWeight: FontWeight.bold),
              bodyMedium: const TextStyle(fontWeight: FontWeight.bold),
            )),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: const SummaryScreen(),
      ),
    );
  }
}
