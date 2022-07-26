import 'dart:async';
import 'package:digit41/presentation/global_widgets/app_bottom_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../cubit_logic/net_connection/net_connection_cubit.dart';
import '../../utils/images_path.dart';
import '../../utils/strings.dart';
import '../../utils/utils.dart';
import '../global_widgets/app_button.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      navigateToPage(context, const AppBottomNav(), replace: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(child: SvgPicture.asset(Images.splashLogo)),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: BlocBuilder<NetConnectionCubit, NetConnectionState>(
                builder: (ctx, state) {
                  return state is NetConnected
                      ? const CupertinoActivityIndicator()
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: AppButton(
                            title: Strings.tryAgain,
                            onTap: () {
                              ctx.read<NetConnectionCubit>().checkNet();
                            },
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
