import 'package:flutter/material.dart';

class WindowsStateModel extends ChangeNotifier {
  bool _startMenuCollapsed = true;

  void collapseStartMenu(bool collapsed) {
    _startMenuCollapsed = collapsed;
    notifyListeners();
  }

  bool startMenuCollapsed() {
    return _startMenuCollapsed;
  }
}