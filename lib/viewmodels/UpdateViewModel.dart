import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notice_anniversary/const/ConstInfo.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/models/repository/StorageRepository.dart';

class UpdateViewModel extends ChangeNotifier {
  final StorageRepository _storageRepository = StorageRepository();

  //region view関連

  //追加か更新かの判断に使用する
  bool _isUpdate = false;

  bool get isUpdate => _isUpdate;

  String _dialogText = "追加";

  String get dialogText => _dialogText;

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

  void setItems(bool isUpdate, int? id) {
    _isUpdate = isUpdate;

    if (anniversaryItems.length == 0) {
      anniversaryItems.add(DropdownMenuItem(value: 0, child: Text("記念日")));
      anniversaryItems.add(DropdownMenuItem(value: 1, child: Text("誕生日")));
      anniversaryItems.add(DropdownMenuItem(value: 2, child: Text("その他")));
    }

    if (_isUpdate) {
      _dialogText = "更新";
      var e = _anniversaries.firstWhere((element) => element.id == id);
      _numAnniversary = e.tagNum;
      _contentTitle = e.title;
      _selectDay = e.dateTime;
    } else {
      _dialogText = "追加";
      _numAnniversary = 0;
      _contentTitle = "";
      _selectDay = DateTime.now();
    }
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

  void onEntry(int? listId) {
    print("UpdateViewModel void onEntry()");
    if (_isUpdate) {
      //更新
      for (final v in _anniversaries) {
        if (v.id == listId) {
          v.title = _contentTitle;
          v.tagNum = _numAnniversary;
          v.dateTime = _selectDay;
          break;
        }
      }
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
