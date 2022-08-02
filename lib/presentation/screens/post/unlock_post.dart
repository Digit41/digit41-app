import 'package:digit41/presentation/global_widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import 'widgets/post_media.dart';
import 'widgets/post_top_info.dart';

class UnlockPost extends StatelessWidget {
  const UnlockPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PostMedia(height: 220.0),
        const SizedBox(height: 8.0),
        const PostTopInfo(
          nameTrailing: Text(
            Strings.creator,
            style: TextStyle(fontSize: 9.0),
          ),
        ),
        const SizedBox(height: 24.0),
        _info(Strings.price, '3'),
        const SizedBox(height: 40.0),
        _info(Strings.totalWalletBalance, '234'),
        const SizedBox(height: 32.0),
        AppButton(title: Strings.unlockItem, onTap: () {}),
      ],
    );
  }

  Widget _info(String title, String amount) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 13.0),
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              SvgPicture.asset(Images.splashLogo, width: 24.0, height: 24.0),
              const SizedBox(width: 8.0),
              Text('$amount DGT', style: const TextStyle(fontSize: 20.0)),
              const SizedBox(width: 8.0),
              Text(
                '(${double.parse(amount) / 10} ETH)',
                style: const TextStyle(fontSize: 13.0, color: Colors.grey),
              ),
            ],
          ),
        ],
      );
}
