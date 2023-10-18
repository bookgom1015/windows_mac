import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/models/control_manager_model.dart';
import 'package:windows_mac/widgets/slider_control.dart';

class ControlManager extends StatefulWidget {
  const ControlManager({super.key});

  @override
  State<StatefulWidget> createState() => _ControlManagerState();
}

class _ControlManagerState extends State<ControlManager>
    with TickerProviderStateMixin {
  bool _firstCall = true;
  late ControlManagerModel _controlManagerModel;

  late AnimationController _controlManagerAnimController;
  late Animation<double> _controlManagerAnimCurve;
  late Animation<double> _controlManagerAnim;

  late AnimationController _stackOneAnimController;
  late Animation<double> _stackOneAnimCurve;
  late Animation<double> _stackOneAnim;

  late AnimationController _stackTwoAnimController;
  late Animation<double> _stackTwoAnimCurve;
  late Animation<double> _stackTwoAnim;

 late AnimationController _stackThreeAnimController;
  late Animation<double> _stackThreeAnimCurve;
  late Animation<double> _stackThreeAnim;

  late AnimationController _stackFourAnimController;
  late Animation<double> _stackFourAnimCurve;
  late Animation<double> _stackFourAnim;

  @override
  void initState() {
    super.initState();
    _controlManagerAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    _controlManagerAnimCurve = CurvedAnimation(parent: _controlManagerAnimController, curve: Curves.easeOutQuad);
    _controlManagerAnim = Tween<double>(begin: 0, end: 1).animate(_controlManagerAnimCurve);

    _stackOneAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 350));
    _stackOneAnimCurve = CurvedAnimation(parent: _stackOneAnimController, curve: Curves.easeOutQuad);
    _stackOneAnim = Tween<double>(begin: 0, end: 1).animate(_stackOneAnimCurve);

    _stackTwoAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _stackTwoAnimCurve = CurvedAnimation(parent: _stackTwoAnimController, curve: Curves.easeOutQuad);
    _stackTwoAnim = Tween<double>(begin: 0, end: 1).animate(_stackTwoAnimCurve);

    _stackThreeAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
    _stackThreeAnimCurve = CurvedAnimation(parent: _stackThreeAnimController, curve: Curves.easeOutQuad);
    _stackThreeAnim = Tween<double>(begin: 0, end: 1).animate(_stackThreeAnimCurve);

    _stackFourAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 650));
    _stackFourAnimCurve = CurvedAnimation(parent: _stackFourAnimController, curve: Curves.easeOutQuad);
    _stackFourAnim = Tween<double>(begin: 0, end: 1).animate(_stackFourAnimCurve);
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
    _controlManagerAnimController.dispose();
    _stackOneAnimController.dispose();
    _stackTwoAnimController.dispose();
    _stackThreeAnimController.dispose();
    _stackFourAnimController.dispose();
    super.dispose();
  }

  void windowsStateChanged() {
    if (!mounted) return;
    if (_controlManagerModel.controlManagerCollapsed()) {
      _controlManagerAnimController.reverse();
      _stackOneAnimController.reverse();
      _stackTwoAnimController.reverse();
      _stackThreeAnimController.reverse();
      _stackFourAnimController.reverse();
    } else {
      _controlManagerAnimController.reset(); _controlManagerAnimController.forward();
      _stackOneAnimController.reset(); _stackOneAnimController.forward();
      _stackTwoAnimController.reset(); _stackTwoAnimController.forward();
      _stackThreeAnimController.reset(); _stackThreeAnimController.forward();
      _stackFourAnimController.reset(); _stackFourAnimController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedBuilder(
        animation: _controlManagerAnimController,
        builder: (_, __) {
          double t = min(_controlManagerAnim.value, 1.0);
          final invT = 1 - t;
          return Transform.translate(
            offset: Offset(-15, t * 45 + invT * -380),
            child: Opacity(
              opacity: t * t,
              child: Container(
                clipBehavior: Clip.hardEdge,
                width: 316,
                height: 416,
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12)
                ),
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16, tileMode: TileMode.clamp),
                  child: Column(
                    children: [
                      AnimatedBuilder(
                        animation: _stackFourAnimController, 
                        builder: (_, __) {
                          final s4 = _stackFourAnim.value;
                          final invS4 = 1 - s4;
                          return Transform.translate(
                            offset: Offset(0, s4 * 0 + invS4 * -160),
                            child: Opacity(
                              opacity: s4 * s4,
                              child: const SliderControl(
                                height: 160,
                              ),
                            )
                          );
                        }
                      ),
                      AnimatedBuilder(
                        animation: _stackThreeAnimController, 
                        builder: (_, __) {
                          final s3 = _stackThreeAnim.value;
                          final invS3 = 1 - s3;
                          return Transform.translate(
                            offset: Offset(0, s3 * 0 + invS3 * -160),
                            child: Opacity(
                              opacity: s3 * s3,
                              child: const SliderControl(
                                height: 80,
                              ),
                            )
                          );
                        }
                      ),
                      AnimatedBuilder(
                        animation: _stackTwoAnimController, 
                        builder: (_, __) {
                          final s2 = _stackTwoAnim.value;
                          final invS2 = 1 - s2;
                          return Transform.translate(
                            offset: Offset(0, s2 * 0 + invS2 * -160),
                            child: Opacity(
                              opacity: s2 * s2,
                              child: const SliderControl(
                                height: 80,
                              ),
                            )
                          );
                        }
                      ),
                      AnimatedBuilder(
                        animation: _stackOneAnimController, 
                        builder: (_, __) {
                          final s1 = _stackOneAnim.value;
                          final invS1 = 1 - s1;
                          return Transform.translate(
                            offset: Offset(0, s1 * 0 + invS1 * -160),
                            child: Opacity(
                              opacity: s1 * s1,
                              child: const SliderControl(
                                height: 80,
                              ),
                            )
                          );
                        }
                      )
                    ],
                  )
                )
              ),
            ),
          );
        },
      ),
    );
  }
}
