import 'dart:math';

import 'package:flutter/material.dart';

import '../providers/party.dart';
import '../models/fellow.dart';
import '../models/transaction.dart';

class Transactions with ChangeNotifier {
  final List<Transaction> _items = [];

  Transaction createDummyTransaction(Party party, {fromIndex}) {
    fromIndex ??= Random().nextInt(party.size);
    final from = party[fromIndex];

    int numberReceivers = -1;
    while (true) {
      numberReceivers = Random().nextInt(party.size - 1);
      if (numberReceivers != 0) break;
    }
    final List<int> toIndices = [];
    final List<Fellow> to = [];
    for (int i = 0; i < numberReceivers; i++) {
      while (true) {
        final tryIndex = Random().nextInt(party.size);
        if (tryIndex == fromIndex || toIndices.contains(tryIndex)) {
          continue;
        }
        toIndices.add(tryIndex);
        to.add(party[tryIndex]);
        break;
      }
    }

    final amount = Random().nextInt(50000);
    final date = DateTime.now().subtract(Duration(days: Random().nextInt(10)));

    return Transaction(from: from, to: to, amount: amount, date: date);
  }

  void initializeWithDummy(Party party) {
    _items.add(createDummyTransaction(party, fromIndex: 0));
    // _items.add(createDummyTransaction(party));
    // _items.add(createDummyTransaction(party));
    // _items.add(createDummyTransaction(party));
    // _items.add(createDummyTransaction(party));
    // _items.add(createDummyTransaction(party));
  }

  void add(Transaction transaction) {
    _items.add(transaction);
    notifyListeners();
  }

  Transaction operator [](int index) => _items[index];

  int get number => _items.length;

  int amountLend(UniqueKey fellowId) {
    var sum = 0;
    for (var transaction in _items) {
      if (transaction.from.id == fellowId) {
        sum += transaction.amount;
      }
    }
    return sum;
  }

  int amountBorrowed(UniqueKey fellowId) {
    var sum = 0;
    for (var transaction in _items) {
      if (transaction.toContains(fellowId)) {
        sum += transaction.amount ~/ transaction.to.length;
      }
    }
    return sum;
  }

  int balance(UniqueKey fellowId) {
    return amountLend(fellowId) - amountBorrowed(fellowId);
  }

  int numberOfTransactions(UniqueKey fellowId) {
    var sum = 0;
    for (var transaction in _items) {
      if (transaction.from.id == fellowId || transaction.toContains(fellowId)) {
        sum += 1;
      }
    }
    return sum;
  }
}
