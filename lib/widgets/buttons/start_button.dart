import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/icons/windows_icon.dart';
import 'package:windows_mac/widgets/models/windows_state_model.dart';

class StartButton extends StatefulWidget {

  const StartButton({super.key});

  @override
  State<StatefulWidget> createState() => _StartButton();
}

class _StartButton extends State<StartButton> {
  bool _firstCall = true;
  late WindowsStateModel _windowsStateModel;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_firstCall) {
      _firstCall = false;
      _windowsStateModel = context.watch<WindowsStateModel>();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          final status = _windowsStateModel.startMenuCollapsed();
          _windowsStateModel.collapseStartMenu(!status);
        },
        child: WindowsIcon(),
      ),
    );
  }
}