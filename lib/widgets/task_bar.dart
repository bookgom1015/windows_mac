import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:windows_mac/widgets/buttons/start_button.dart';
import 'package:windows_mac/widgets/custom_box_shadow.dart';

class TaskBar extends StatefulWidget {
  const TaskBar({super.key});

  @override
  State<StatefulWidget> createState() => _TaskBarState();
}

class _TaskBarState extends State<TaskBar> {
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
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              CustomBoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 16,
                blurStyle: BlurStyle.outer
              )
            ]
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32, tileMode: TileMode.clamp),
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