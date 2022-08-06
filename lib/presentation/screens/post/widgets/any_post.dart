import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../global_widgets/app_bottom_sheet.dart';
import '../send_tip.dart';
import '../unlock_post.dart';
import 'post_media.dart';
import 'post_top_info.dart';

class AnyPost extends StatelessWidget {
  const AnyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PostTopInfo(),
        PostMedia(
          btnOnTap: () {
            showGeneralBottomSheet(
              context,
              title: Strings.unlock,
              child: const UnlockPost(),
            );
          },
        ),
        Row(
          children: [
            _anyOption(Images.like, '10'),
            const SizedBox(width: 20.0),
            _anyOption(Images.comment, '2'),
            const SizedBox(width: 22.0),
            _anyOption(Images.heartDigit, '2'),
            const SizedBox(width: 22.0),
            Expanded(
              child: _anyOption(
                Images.money,
                Strings.sendTip,
                onTap: () {
                  showGeneralBottomSheet(
                    context,
                    title: '${Strings.sendTip} ${Strings.to}',
                    child: SendTip(),
                  );
                },
              ),
            ),
            SvgPicture.asset(Images.fav),
          ],
        ),
        const SizedBox(height: 10.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: AppTheme.sFontSize,
            ),
            children: [
              const TextSpan(
                // todo: this will change
                text:
                    'sdfdssdcdcsdccsdcdcscvssdvdvdsvdvdsvdvdvsdfdfdfsdfdsfdsdsdcsddvddsvdvdvdvdvdvsdvddsdcd',
                style: TextStyle(height: 1.5),
              ),
              TextSpan(
                  text: ' ${Strings.more}',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                  recognizer: TapGestureRecognizer()..onTap = () {}),
            ],
          ),
        ),
        const SizedBox(height: 8.0),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            // todo: this will change
            '2 days ago',
            style: TextStyle(fontSize: AppTheme.ssFontSize, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }

  Widget _anyOption(String icon, String val, {GestureTapCallback? onTap}) =>
      GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            const SizedBox(width: 4.0),
            Text(val, style: TextStyle(fontSize: AppTheme.sFontSize)),
          ],
        ),
      );
}
