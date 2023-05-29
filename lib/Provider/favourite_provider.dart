// ignore_for_file: prefer_final_fields

import 'package:flutter/foundation.dart';

class FavouriteItemProvider with ChangeNotifier {
  List<int> _selectItem = [];

  List<int> get selectItem => _selectItem;

  void addItem(int value) {
    _selectItem.add(value);
    notifyListeners();
  }

  void removeItem(int value) {
    _selectItem.remove(value);
    notifyListeners();
  }
}
