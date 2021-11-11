import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StorageRepository {
  //TODO:Modelを読む。書き込む
  final _PersistenceStorageProvider _instance =
      _PersistenceStorageProvider.instance;

  //書き込み
  Future<void> saveStorageAnniversary(
    String key,
    List<String> valueList,
  ) async {
    var completer = new Completer<void>();
    _instance.prefs.then((pref) {
      completer.complete(pref.setStringList(key, valueList));
    });
    return completer.future;
  }

  //読み込み
  Future<List<String>> loadStorageAnniversary(String key) async {
    var completer = new Completer<List<String>>();
    _instance.prefs.then((pref) {
      completer.complete(pref.getStringList(key));
    });
    return completer.future;
  }
}

class _PersistenceStorageProvider {
  //SharedPreferencesのインスタンス生成
  _PersistenceStorageProvider._();

  static final _PersistenceStorageProvider instance =
      _PersistenceStorageProvider._();

  SharedPreferences? _prefs;

  Future<SharedPreferences> get prefs async {
    if (_prefs != null) {
      return _prefs!;
    }
    return initSharedPreferences();
  }

  Future<SharedPreferences> initSharedPreferences() async {
    var completer = new Completer<SharedPreferences>();
    SharedPreferences.getInstance().then((prefs) {
      completer.complete(prefs);
    });
    return completer.future;
  }
}
