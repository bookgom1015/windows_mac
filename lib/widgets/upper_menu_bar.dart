import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';
import 'package:windows_mac/widgets/models/control_manager_model.dart';

class UpperMenuBar extends StatefulWidget {
  const UpperMenuBar({super.key});

  @override
  State<StatefulWidget> createState() => _UpperMenuBarState();
}

class _UpperMenuBarState extends State<UpperMenuBar> {
  bool _firstCall = true;
  late ControlManagerModel _controlManagerModel;

  DateTime _now = DateTime.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _now = DateTime.now();
      });
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_firstCall) {
      _firstCall = false;
      _controlManagerModel = context.watch<ControlManagerModel>();
      _controlManagerModel.addListener(windowsStateChanged);
    }
  }

  @override
  void dispose() {
    _controlManagerModel.removeListener(windowsStateChanged);
    super.dispose();
  }

  void windowsStateChanged() {}

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 0),
            color: Colors.black,
            child: Stack(
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ReactingButton(
                        width: 45,
                        height: 25,
                        hoveringColor: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        child: const Center(
                          child:
                              Icon(Icons.apple, size: 20, color: Colors.white),
                        ),
                      )
                    ]),
                Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ReactingButton(
                        width: 45,
                        height: 25,
                        hoveringColor: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        child: const Icon(
                          Icons.wifi,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      ReactingButton(
                        width: 45,
                        height: 25,
                        hoveringColor: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(4),
                        child: const Icon(
                          Icons.search,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      ReactingButton(
                        width: 45,
                        height: 25,
                        hoveringColor: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        onTap: () {
                          final status =
                              _controlManagerModel.controlManagerCollapsed();
                          _controlManagerModel.collapseControlManager(!status);
                        },
                        child: const Icon(Icons.bento,
                            size: 20, color: Colors.white),
                      ),
                      ReactingButton(
                        width: 175,
                        height: 25,
                        hoveringColor: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(6),
                        child: Center(
                          child: Text(
                            DateFormat('EEE MMM dd hh:mm a').format(_now),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ])
              ],
            )));
  }
}
