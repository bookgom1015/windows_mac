import 'package:flutter/material.dart';
import 'package:windows_mac/widgets/control_manager.dart';
import 'package:windows_mac/widgets/network_manager.dart';
import 'package:windows_mac/widgets/spotlight_search.dart';
import 'package:windows_mac/widgets/upper_menu/upper_menu_bar.dart';
import 'package:windows_mac/widgets/bigsur_background.dart';
import 'package:windows_mac/widgets/start_menu.dart';
import 'package:windows_mac/widgets/task_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _startMenumState = GlobalKey<StartMenuState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const BigSurBackground(),
      StartMenu(key: _startMenumState),
      const NetworkManager(),
      const ControlManager(),
      const SpotlightSearch(),
      const UpperMenuBar(),
      const TaskBar(),
    ]));
  }
}
