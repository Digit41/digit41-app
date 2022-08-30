import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/app_theme.dart';
import '../../utils/images_path.dart';

class UserInfo extends StatelessWidget {
  final Widget nameTrailing;
  final bool showVerify;

  const UserInfo(
      {Key? key, this.nameTrailing = const Center(), this.showVerify = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: SvgPicture.asset(
            Images.splashLogo,
            width: 28.0,
            height: 28.0,
          ),
        ),
        const SizedBox(width: 6.0),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        // todo: this will change
                        'Abo ghanbari',
                        style: TextStyle(fontSize: AppTheme.sFontSize),
                      ),
                      const SizedBox(width: 8.0),
                      Visibility(
                        visible: showVerify,
                        child: SvgPicture.asset(Images.verify, width: 18.0),
                      ),
                    ],
                  ),
                  nameTrailing,
                ],
              ),
              const SizedBox(height: 2.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade900,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 1.0,
                      horizontal: 4.0,
                    ),
                    child: Text(
                      'ENS',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontSize: AppTheme.ssFontSize,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    // todo: this will change
                    'sofdo.com',
                    style: TextStyle(fontSize: AppTheme.ssFontSize),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
