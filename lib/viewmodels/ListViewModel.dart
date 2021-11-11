import 'package:flutter/material.dart';
import 'package:notice_anniversary/models/repository/StorageRepository.dart';

class ListViewModel extends ChangeNotifier {
  final StorageRepository _storageRepository = StorageRepository();

}
