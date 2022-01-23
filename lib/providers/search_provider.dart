import 'package:flutter/foundation.dart';

class SearchProvider with ChangeNotifier, DiagnosticableTreeMixin {
  String page = '1';
  void updatePage(String value, {bool notify = true}) {
    this.page = value;
    if (notify == true) {
      notifyListeners();
    }
  }

  int _categoryActive = 1; //1 : user, 2 : issues, 3 : repositories
  int get getCategoryActive => _categoryActive;
  void changeCategorActive(int value) {
    this._categoryActive = value;
    notifyListeners();
  }

  String _query = '';
  String get getQuery => _query;
  void updateQuery(String value, {bool notify = true}) {
    this._query = value;
    if (notify == true) {
      notifyListeners();
    }
  }
}
