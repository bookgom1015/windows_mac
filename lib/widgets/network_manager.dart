import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:windows_mac/widgets/models/manager_model.dart';

class NetworkManager extends StatefulWidget {
  const NetworkManager({super.key});

  @override
  State<StatefulWidget> createState() => _NetworkManagerState();
}

class _NetworkManagerState extends State<NetworkManager> with TickerProviderStateMixin {
  bool _firstCall = true;
  late ManagerModel _managerModel;
  
  late AnimationController _networkManagerAnimController;
  late Animation<double> _networkManagerAnimCurve;
  late Animation<double> _networkManagerAnim;

  @override
  void initState() {
    super.initState();
    _networkManagerAnimController = AnimationController(vsync: this, duration: const Duration(milliseconds: 250));
    _networkManagerAnimCurve = CurvedAnimation(parent: _networkManagerAnimController, curve: Curves.easeOutQuad);
    _networkManagerAnim = Tween<double>(begin: 0, end: 1).animate(_networkManagerAnimCurve);
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
    _networkManagerAnimController.dispose();
    super.dispose();
  }

  void managerStateChanged() {
    if (!mounted) return;
    if (_managerModel.collapsed(ManagerType.eNetwork)) {
      _networkManagerAnimController.reverse();
    } else {
      _networkManagerAnimController.reset(); _networkManagerAnimController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: AnimatedBuilder(
        animation: _networkManagerAnimController,
        builder: (_, __) {
          final t = _networkManagerAnim.value;
          final invT = 1 - t;
          return Transform.translate(
            offset: Offset(-285 + 130, t * 45 + invT * -540),
            child: Opacity(
              opacity: t * t,
              child: networkPanel(),
            ),
          );
        },
      ),
    );
  }

  Widget networkPanel() {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 280,
      constraints: const BoxConstraints(
        minHeight: 360,
        maxHeight: 540
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12)
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16, tileMode: TileMode.clamp),
        child: Container(
          color: Colors.black.withOpacity(0.45),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Wi-Fi",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              ),
              Container(
                height: 2,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                color: Colors.white.withOpacity(0.15),
              )
            ],
          ),
        ),
      ),
    );
  }
}