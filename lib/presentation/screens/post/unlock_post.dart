import 'package:digit41/presentation/snack_bars/post_unlock_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_button.dart';
import 'widgets/post_media.dart';
import 'widgets/post_top_info.dart';

class UnlockPost extends StatelessWidget {
  const UnlockPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PostMedia(height: 210.0),
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
        Visibility(visible: true, child: _notEnoughBalance()),
        const SizedBox(height: 32.0),
        AppButton(
            title: Strings.unlockItem,
            onTap: () {
              showTopSnackBar(context, PostUnlockSnack(postName: 'postName'));
            }),
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

  Widget _notEnoughBalance() => Padding(
    padding: const EdgeInsets.only(top: 20.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red.withOpacity(0.3),
            borderRadius: BorderRadius.circular(25.0),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 7.0),
          child: const Text(
            'askdasdksdksadkas',
            style: TextStyle(color: Colors.red),
          ),
        ),
        Positioned(
          left: 0.0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(25.0),
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(Icons.clear, color: Colors.white, size: 14.0),
          ),
        ),
      ],
    ),
  );
}
