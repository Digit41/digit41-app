import 'package:flutter/material.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../global_widgets/app_button.dart';

class EmptyTab extends StatelessWidget {
  final String msg;
  final String btnTitle;
  final GestureTapCallback onTap;

  const EmptyTab(
      {Key? key,
      required this.msg,
      required this.btnTitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.moon, width: 110.0, height: 110.0),
          const SizedBox(height: 12.0),
          Text(msg, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 24.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: AppButton(
              title: btnTitle,
              onTap: onTap,
                color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }
}
