import 'package:flutter/material.dart';
import 'package:notice_anniversary/const/ConstInfo.dart';
import 'package:notice_anniversary/models/model/AnniversaryModel.dart';
import 'package:notice_anniversary/models/repository/StorageRepository.dart';

class ListViewModel extends ChangeNotifier {
  final StorageRepository _storageRepository = StorageRepository();

  List<Anniversary> _anniversaries = [];

  List<Anniversary> get anniversaries => _anniversaries;

  Future<void> loadAnniversary() async {
    _anniversaries =
        await _storageRepository.loadStorageAnniversary(storageKey);
    notifyListeners();
  }
}
