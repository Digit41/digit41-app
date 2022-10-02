import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_button.dart';
import '../../global_widgets/user_info.dart';
import 'tabs/tabs.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfo(showVerify: true),
              const SizedBox(height: 32.0),
              Text(
                Strings.tellUs,
                style: TextStyle(fontSize: AppTheme.sFontSize),
              ),
              const SizedBox(height: 16.0),
              AppButton(
                title: Strings.settings,
                color: AppTheme.grey,
                titleColor: Colors.white,
                titleSize: 12.0,
                icon: SvgPicture.asset(Images.settings),
                spaceBetween: false,
                onTap: () {},
              ),
            ],
          ),
        ),
        const Expanded(child: ProfileTabs()),
      ],
    );
  }
}
