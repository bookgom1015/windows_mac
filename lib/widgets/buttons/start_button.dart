import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/icons/windows_icon.dart';
import 'package:windows_mac/widgets/models/start_menu_model.dart';

class StartButton extends StatefulWidget {

  const StartButton({super.key});

  @override
  State<StatefulWidget> createState() => _StartButton();
}

class _StartButton extends State<StartButton> {
  bool _firstCall = true;
  late StartMenuModel _startMenuModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_firstCall) {
      _firstCall = false;
      _startMenuModel = context.watch<StartMenuModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final status = _startMenuModel.startMenuCollapsed();
          _startMenuModel.collapseStartMenu(!status);
        },
        child: const WindowsIcon(),
      ),
    );
  }
}