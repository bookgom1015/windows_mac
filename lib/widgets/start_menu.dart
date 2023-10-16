import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/models/windows_state_model.dart';

class StartMenu extends StatefulWidget {
  const StartMenu({required Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartMenuState();
}

class StartMenuState extends State<StartMenu>
    with SingleTickerProviderStateMixin {
  bool _firstCall = true;
  late WindowsStateModel _windowsStateModel;

  late AnimationController _startMenuAnimController;
  late Animation<double> _startMenuAnimCurve;
  late Animation<double> _startMenuAnim;

  late Animation<double> _menuContentAnimCurve;
  late Animation<double> _menuContentAnim;

  final double _collapsedWidth = 55;
  final double _width = 550;
  final double _collapsedHeight = 55;
  final double _height = 650;

  final double _offsetY = -125;
  final double _collapsedOffsetY = -25;

  @override
  void initState() {
    super.initState();
    _startMenuAnimController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 350));
    _startMenuAnimCurve = CurvedAnimation(
        parent: _startMenuAnimController, curve: Curves.easeOutQuint);
    _startMenuAnim =
        Tween<double>(begin: 0, end: 1).animate(_startMenuAnimCurve);

    _menuContentAnimCurve =
        CurvedAnimation(parent: _startMenuAnimController, curve: Curves.linear);
    _menuContentAnim =
        Tween<double>(begin: 0, end: 1).animate(_menuContentAnimCurve);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_firstCall) {
      _firstCall = false;
      _windowsStateModel = context.watch<WindowsStateModel>();
      _windowsStateModel.addListener(windowsStateChanged);
    }
  }

  @override
  void dispose() {
    _windowsStateModel.removeListener(windowsStateChanged);
    super.dispose();
  }

  void windowsStateChanged() {
    if (_windowsStateModel.startMenuCollapsed()) {
      _startMenuAnimController.reverse();
    } else {
      _startMenuAnimController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedBuilder(
            animation: _startMenuAnimController,
            builder: (_, __) {
              final t1 = _startMenuAnim.value;
              final invT1 = 1 - t1;
              final t2 = _menuContentAnim.value;
              final invT2 = 1 - t2;
              return Transform.translate(
                offset: Offset(0, invT1 * _collapsedOffsetY + t1 * _offsetY),
                child: Opacity(
                    opacity: t1 * t1 * t1,
                    child: Container(
                      clipBehavior: Clip.hardEdge,
                      width: invT1 * _collapsedWidth + t1 * _width,
                      height: invT1 * _collapsedHeight + t1 * _height,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 84, 84, 84),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.15),
                              blurRadius: 16,
                              spreadRadius: 4,
                            )
                          ]),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: SingleChildScrollView(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width:
                                max(invT1 * _collapsedWidth + t1 * _width, 400),
                            height: _height,
                            child: Transform.translate(
                              offset: Offset(0, t2 * 0 + invT2 * 100),
                              child: Padding(
                                padding: const EdgeInsets.all(25),
                                child: Opacity(
                                  opacity: t2,
                                  child: const Column(
                                    children: [
                                      StartMenuSearchBar(),
                                      SizedBox(height: 35),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              "Pinned",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          )
                                        ],
                                      )),
                                      SizedBox(height: 20),
                                      Expanded(
                                          child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Text(
                                              "Recommended",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            ),
                                          )
                                        ],
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )),
              );
            }));
  }
}

class StartMenuSearchBar extends StatefulWidget {
  const StartMenuSearchBar({super.key});

  @override
  State<StatefulWidget> createState() => _StartMenuSearchBar();
}

class _StartMenuSearchBar extends State<StartMenuSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Focus(
        onFocusChange: (value) {
          print(value);
        },
        child: Container(
          height: 35,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 74, 74, 74),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 22,
                  color: Color.fromARGB(255, 130, 130, 130),
                ),
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10, bottom: 17),
                      border: InputBorder.none,
                    ),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
