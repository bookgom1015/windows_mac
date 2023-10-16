import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:windows_mac/widgets/buttons/start_button.dart';

class TaskBar extends StatefulWidget {
  const TaskBar({super.key});

  @override
  State<StatefulWidget> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
  final double _sigma = 16;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Transform.translate(
        offset: const Offset(0, -15),
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 75,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(16)
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma, tileMode: TileMode.clamp),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                StartButton()
              ]
            )
          )
        )
      ),
    );
  }
}