import 'package:flutter/material.dart';

enum ManagerType {
  eNone,
  eNetwork,
  eControl,
}

class ManagerModel extends ChangeNotifier {
  ManagerType _activatedManager = ManagerType.eNone;

  void collapse(ManagerType type) {
    if (_activatedManager != type) return;
    _activatedManager = ManagerType.eNone;
    notifyListeners();
  } 

  void uncollapse(ManagerType type) {
    _activatedManager = type;
    notifyListeners();
  }

  bool collapsed(ManagerType type) {
    return _activatedManager != type;
  }
}