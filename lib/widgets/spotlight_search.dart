import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/buttons/reacting_button.dart';
import 'package:windows_mac/widgets/custom_box_shadow.dart';
import 'package:windows_mac/widgets/models/manager_model.dart';

class SpotlightSearch extends StatefulWidget {
  const SpotlightSearch({super.key});

  @override
  State<StatefulWidget> createState() => _SpotlightSearchState();
}

class _SpotlightSearchState extends State<SpotlightSearch> with TickerProviderStateMixin {
  bool _firstCall = true;
  late ManagerModel _managerModel;

  late AnimationController _barAnimController;
  late Animation<double> _barAnimCurve;
  late Animation<double> _barAnim;

  @override
  void initState() {
    super.initState();
    _barAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    _barAnimCurve = CurvedAnimation(parent: _barAnimController, curve: Curves.easeInOutExpo);
    _barAnim = Tween<double>(begin: 0, end: 1).animate(_barAnimCurve);
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
    _barAnimController.dispose();
    super.dispose();
  }

  void managerStateChanged() {
    if (!mounted) return;
    if (_managerModel.collapsed(ManagerType.eSpotlight)) {
      _barAnimController.reverse();
    } else {
      _barAnimController.reset(); _barAnimController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Transform.translate(
        offset: const Offset(0, 135),
        child: AnimatedBuilder(
          animation: _barAnimController,
          builder: (_, __) {
            final t = _barAnim.value;
            final invT = 1 - t;
            return Opacity(
              opacity: t * t,
              child: Transform.scale(
                scale: t * t,
                child: Transform.translate(
                  offset: Offset(0, -250 * invT),
                  child: spotlightBar(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget spotlightBar() {
    return Container(
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
    );
  }
}