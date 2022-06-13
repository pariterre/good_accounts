import 'package:flutter/material.dart';
import '../models/fellow.dart';

class Party with ChangeNotifier {
  final List<Fellow> _party = [];

  void initializeWithDummy() {
    _party.add(
      Fellow(
          firstName: 'Indiana',
          middleName: 'Christie',
          lastName: 'Woodrow',
          pseudo: 'Pariterre',
          avatarUrl:
              'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'),
    );
    _party.add(
      Fellow(
          firstName: 'Lou',
          middleName: 'Emory',
          lastName: 'Carver',
          avatarUrl:
              'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'),
    );
    _party.add(Fellow(
        firstName: 'Lee',
        lastName: 'Schöttmer',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
    _party.add(Fellow(
        firstName: 'Addison',
        lastName: 'Thompson',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
    _party.add(Fellow(
        firstName: 'Schwanhild',
        lastName: 'Sebastian',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
    _party.add(Fellow(
        firstName: 'Ora',
        lastName: 'Snell',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
    _party.add(Fellow(
        firstName: 'Emery',
        lastName: 'Knepp',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
    _party.add(Fellow(
        firstName: 'Jordane',
        lastName: 'Chaplin',
        avatarUrl:
            'https://cdn.vox-cdn.com/thumbor/FF7o8sxkFV0qk1V-K6BEPWccv8I=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/19981122/atla_tvguide.jpg'));
  }

  void addFellow(Fellow fellow) {
    _party.add(fellow);
    notifyListeners();
  }

  Fellow operator [](value) {
    return _party[value];
  }

  int get size => _party.length;
}
