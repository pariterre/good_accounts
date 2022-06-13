import 'package:flutter/cupertino.dart';

import '../providers/party.dart';

class Fellow {
  final String firstName;
  final String? middleName;
  final String lastName;
  final Party _fellowFriends = Party();
  final String avatarUrl;
  final UniqueKey id = UniqueKey();

  String get fullName =>
      '$firstName ${middleName == null ? '' : '${middleName![0]}. '}$lastName';

  Fellow({
    required this.firstName,
    this.middleName,
    required this.lastName,
    String? pseudo,
    required this.avatarUrl,
  });

  void addFriend(Fellow fellow) {
    _fellowFriends.addFellow(fellow);
  }

  Fellow operator [](int value) {
    return _fellowFriends[value];
  }

  @override
  String toString() {
    return fullName;
  }
}
