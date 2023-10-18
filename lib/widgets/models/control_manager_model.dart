import 'package:flutter/material.dart';

class ControlManagerModel extends ChangeNotifier {
  bool _controlManagerCollapsed = true;

  void collapseControlManager(bool collapsed) {
    _controlManagerCollapsed = collapsed;
    notifyListeners();
  }

  bool controlManagerCollapsed() {
    return _controlManagerCollapsed;
  }
}