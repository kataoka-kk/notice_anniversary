import 'package:flutter/material.dart';

class UpdateViewModel extends ChangeNotifier {
  bool _isInit = false;

  bool get isInit => _isInit;

  int _numAnniversary = 0;

  int get numAnniversary => _numAnniversary;

  DateTime _selectDay = DateTime.now();

  DateTime get selectDay => _selectDay;

  List<DropdownMenuItem<int>> _anniversaryItems = [];

  List<DropdownMenuItem<int>> get anniversaryItems => _anniversaryItems;

  void setItems() {
    anniversaryItems.add(DropdownMenuItem(value: 0, child: Text("記念日")));
    anniversaryItems.add(DropdownMenuItem(value: 1, child: Text("誕生日")));
    anniversaryItems.add(DropdownMenuItem(value: 2, child: Text("その他")));
    _isInit = true;
  }

  void onChanged(int? value) {
    print("onChanged：$value");
    _numAnniversary = value!;
    notifyListeners();
  }

  void onConfirm(DateTime date) {
    print("onConfirm：$date");
    _selectDay = date;
    notifyListeners();
  }
}
