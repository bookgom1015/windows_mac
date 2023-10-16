import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';

class UpperBar extends StatefulWidget {
  const UpperBar({super.key});

  @override
  State<StatefulWidget> createState() => _UpperBarState();
}

class _UpperBarState extends State<UpperBar> {
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
  void dispose() {
    super.dispose();
  }

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
