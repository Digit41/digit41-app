import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../cubit_logic/net_connection/net_connection_cubit.dart';
import '../../utils/images_path.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../global_widgets/app_bottom_nav.dart';
import '../global_widgets/app_button.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool _netConnected = true;
  late Timer _timer;

  void _init() {
    _timer = Timer(const Duration(seconds: 1), () {
      if (_netConnected)
        navigateToPage(context, const AppBottomNav(), replace: true);
    });
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: BlocConsumer<NetConnectionCubit, NetConnectionState>(
          listener: (_, state) {
            if (state is NetConnected) {
              _netConnected = true;
              if (!_timer.isActive) _init();
            } else
              _netConnected = false;
          },
          builder: (ctx, state) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(Images.splashLogo),
                        const SizedBox(height: 16.0),
                        if (state is! NetConnected)
                          const Text(Strings.netIsNotConnect),
                      ],
                    ),
                  ),
                  state is NetConnected
                      ? const CupertinoActivityIndicator()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppButton(
                            title: Strings.tryAgain,
                            onTap: () {
                              ctx.read<NetConnectionCubit>().checkNet();
                            },
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
