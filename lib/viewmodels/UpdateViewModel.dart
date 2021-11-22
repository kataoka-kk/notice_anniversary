import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notice_anniversary/const/ConstInfo.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/models/repository/StorageRepository.dart';

class UpdateViewModel extends ChangeNotifier {
  final StorageRepository _storageRepository = StorageRepository();

  //region view関連
  bool _isInit = false;

  bool get isInit => _isInit;

  //追加か更新かの判断に使用する
  bool _isUpdate = false;

  bool get isUpdate => _isUpdate;

  String _contentText = "追加";

  String get contentText => _contentText;

  //endregion

  //記念日選択の中身の保管先
  int _numAnniversary = 0;

  int get numAnniversary => _numAnniversary;

  //画面タイトルの保管先
  String _contentTitle = "";

  String get contentTitle => _contentTitle;

  //画面日付の保管先
  DateTime _selectDay = DateTime.now();

  DateTime get selectDay => _selectDay;

  List<DropdownMenuItem<int>> _anniversaryItems = [];

  List<DropdownMenuItem<int>> get anniversaryItems => _anniversaryItems;

  List<Anniversary> _anniversaries = [];

  List<Anniversary> get anniversaries => _anniversaries;

  set anniversaries(List<Anniversary> value) {
    _anniversaries = value;
  }

  void setItems(bool isUpdate) {
    print("UpdateViewModel setItems");
    print(isUpdate);
    anniversaryItems.add(DropdownMenuItem(value: 0, child: Text("記念日")));
    anniversaryItems.add(DropdownMenuItem(value: 1, child: Text("誕生日")));
    anniversaryItems.add(DropdownMenuItem(value: 2, child: Text("その他")));
    _isInit = true;
    _isUpdate = isUpdate;
    _isUpdate ? _contentText = "更新" : _contentText = "追加";
  }

  void onDropdownChanged(int? value) {
    print("onChanged：$value");
    _numAnniversary = value!;
    notifyListeners();
  }

  void onTitleChanged(String value) {
    _contentTitle = value;
  }

  void onConfirm(DateTime date) {
    print("onConfirm：$date");
    _selectDay = date;
    notifyListeners();
  }

  void onEntry() {
    //updateに関しては、prefs.setString('data', "fine");こんな感じですぐできる。
    print("UpdateViewModel void onEntry()");
    if (_isUpdate) {
      //新規

      //TODO:1.追加の場合
      //既存リストに新しくaddしたリストの作成
      //saveStorageAnniversaryに渡す
      
    } else {
      print("UpdateViewModel add");
      //追加
      _anniversaries.add(
        Anniversary(
          id: _anniversaries.length,
          title: _contentTitle,
          tagNum: _numAnniversary,
          dateTime: _selectDay,
        ),
      );
    }

    List<String> list =
        _anniversaries.map((e) => json.encode(e.toJson())).toList();

    _storageRepository.saveStorageAnniversary(storageKey, list);
  }
}
