import 'package:flutter/material.dart';
import 'package:notice_anniversary/const/ConstInfo.dart';
import 'package:notice_anniversary/models/repository/StorageRepository.dart';

class UpdateViewModel extends ChangeNotifier {
  final StorageRepository _storageRepository = StorageRepository();

  bool _isInit = false;

  bool get isInit => _isInit;

  //追加か更新かの判断に使用する
  bool _isUpdate = false;

  bool get isUpdate => _isUpdate;

  String _contentText = "追加";

  String get contentText => _contentText;

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

    _isUpdate ? _contentText = "更新" : _contentText = "追加";
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

  void onEntry() {
    //updateに関しては、prefs.setString('data', "fine");こんな感じですぐできる。

    //TODO:1.追加の場合
    //既存リストに新しくaddしたリストの作成
    //saveStorageAnniversaryに渡す

    //TODO:2.更新の場合
    //既存リストの対象オブジェクトを上書きを行う
    //のち、それをリスト化
    //のち、saveStorageAnniversaryに渡す

    // _storageRepository.saveStorageAnniversary(storageKey,)
  }
}
