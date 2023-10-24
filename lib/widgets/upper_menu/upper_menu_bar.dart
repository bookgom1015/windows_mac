import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';
import 'package:windows_mac/widgets/models/manager_model.dart';

class UpperMenuBar extends StatefulWidget {
  const UpperMenuBar({super.key});

  @override
  State<StatefulWidget> createState() => _UpperMenuBarState();
}

class _UpperMenuBarState extends State<UpperMenuBar> {
  bool _firstCall = true;
  late ManagerModel _managerModel;

  DateTime _now = DateTime.now();

  late List<Widget> _menuList;

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
      _managerModel = context.watch<ManagerModel>();
      _managerModel.addListener(managerStateChanged);
    }
  }

  @override
  void dispose() {
    _managerModel.removeListener(managerStateChanged);
    super.dispose();
  }

  void managerStateChanged() {}

  @override
  Widget build(BuildContext context) {
    _menuList = [
      ReactingButton(
        width: 50, 
        height: 25,
        hoveringColor: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        child: Center(
          child: Text(
            "File",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13
            ),
          ),
        ),
      ),
      ReactingButton(
        width: 50, 
        height: 25,
        hoveringColor: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        child: Center(
          child: Text(
            "Edit",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13
            ),
          ),
        ),
      ),
      ReactingButton(
        width: 50, 
        height: 25,
        hoveringColor: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(6),
        child: Center(
          child: Text(
            "View",
            style: TextStyle(
              color: Colors.white,
              fontSize: 13
            ),
          ),
        ),
      ),
    ];
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
                ),
                Expanded(
                  child: Row(
                    children: _menuList,
                  )
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ReactingButton(
                  width: 45,
                  height: 25,
                  hoveringColor: Colors.white.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(6),
                  onTap: () {
                    final status = _managerModel.collapsed(ManagerType.eNetwork);
                    if (status) _managerModel.uncollapse(ManagerType.eNetwork);
                    else _managerModel.collapse(ManagerType.eNetwork);
                  },
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
                    final status = _managerModel.collapsed(ManagerType.eControl);
                    if (status) _managerModel.uncollapse(ManagerType.eControl);
                    else _managerModel.collapse(ManagerType.eControl);
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
              ]
            )
          ],
        )
      )
    );
  }
}
