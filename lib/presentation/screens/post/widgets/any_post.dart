import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/utils.dart';
import '../../../global_widgets/app_bottom_sheet.dart';
import '../../../global_widgets/user_info.dart';
import '../../profile/subscription.dart';
import '../send_tip.dart';
import '../unlock_post.dart';
import 'post_media.dart';

class AnyPost extends StatelessWidget {
  final bool unlocaked;
  ValueNotifier<bool> _expandTxt = ValueNotifier(false);

  AnyPost({Key? key, this.unlocaked = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserInfo(
          onTap: () {
            navigateToPage(context, const Subscription());
          },
        ),
        PostMedia(
          btnOnTap: () {
            showGeneralBottomSheet(
              context,
              title: Strings.unlock,
              child: const UnlockPost(),
            );
          },
          unlocked: unlocaked,
        ),
        Row(
          children: [
            const AnyOptionOfPost(Images.like, '10'),
            const SizedBox(width: 20.0),
            const AnyOptionOfPost(Images.comment, '2'),
            const SizedBox(width: 22.0),
            const AnyOptionOfPost(Images.heartDigit, '2'),
            const SizedBox(width: 22.0),
            Expanded(
              child: AnyOptionOfPost(
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
        ValueListenableBuilder(
          valueListenable: _expandTxt,
          builder: (_, val, ___) => RichText(
            text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyText1!.color,
                fontSize: AppTheme.sFontSize,
              ),
              children: [
                TextSpan(
                  // todo: this will change
                  text: _expandTxt.value
                      ? 'sdfdssdcdcsdccsdcdcscvssdvdvdsvdvdsvdvdvsdfdfdfsdfdsfd'
                      : 'sdsdcsddvddsvdvdvdvdvdvsdvddsdcd',
                  style: const TextStyle(height: 1.5),
                ),
                TextSpan(
                  text: ' ${_expandTxt.value ? Strings.less : Strings.more}',
                  style: TextStyle(color: AppTheme.primaryColor),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _expandTxt.value = !_expandTxt.value;
                    },
                ),
              ],
            ),
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
}

class AnyOptionOfPost extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String icon;
  final String val;

  const AnyOptionOfPost(this.icon, this.val, {Key? key, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
}
