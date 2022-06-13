import 'package:flutter/foundation.dart';

import '../models/fellow.dart';

class Transaction {
  final Fellow from;
  final List<Fellow> to;
  final int amount;
  final DateTime date;
  final UniqueKey id = UniqueKey();

  Transaction({
    required this.from,
    required this.to,
    required this.amount,
    required this.date,
  });

  bool toContains(id) {
    return to.map((e) => e.id).contains(id);
  }

  Iterable<String> get toFullNames {
    return to.map((e) => e.fullName);
  }
}
