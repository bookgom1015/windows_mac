import 'package:flutter/material.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';

class UpperMenuButton extends StatefulWidget {
  const UpperMenuButton({super.key});

  @override
  State<StatefulWidget> createState() => _UpperMenuButton();
}

class _UpperMenuButton extends State<UpperMenuButton> {
  @override
  Widget build(BuildContext context) {
    return ReactingButton(
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
    );
  }
}