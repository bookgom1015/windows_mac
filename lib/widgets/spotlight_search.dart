import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';
import 'package:windows_mac/widgets/custom_box_shadow.dart';

class SpotlightSearch extends StatefulWidget {
  const SpotlightSearch({super.key});

  @override
  State<StatefulWidget> createState() => _SpotlightSearchState();
}

class _SpotlightSearchState extends State<SpotlightSearch> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.translate(
        offset: const Offset(0, 135),
        child: Container(
          clipBehavior: Clip.hardEdge,
          width: 600,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              CustomBoxShadow(
                color: Colors.black.withOpacity(0.75),
                blurRadius: 18,
                blurStyle: BlurStyle.outer
              )
            ]
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16, tileMode: TileMode.clamp),
            child: Container(              
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.45),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Row(
                children: [
                  ReactingButton(
                    width: 60,
                    height: 50,
                    borderRadius: BorderRadius.circular(12),
                    hoveringColor: Colors.white.withOpacity(0.15),
                    child: const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 175, 175, 175),
                      size: 44,
                    )
                  ),
                  Expanded(
                    child: TextFormField(
                      cursorWidth: 3,
                      cursorHeight: 40,
                      cursorColor: Colors.blue,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                        hintText: "Spotlight Search",
                        hintStyle: TextStyle(
                          color: Color.fromARGB(255, 175, 175, 175),
                          fontSize: 28
                        )
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}