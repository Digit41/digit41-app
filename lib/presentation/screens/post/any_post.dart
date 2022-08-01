import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import 'widgets/post_media.dart';
import 'widgets/post_top_info.dart';

class AnyPost extends StatelessWidget {
  const AnyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const PostTopInfo(),
        const PostMedia(),
        Row(
          children: [
            _anyOption(Images.like, '10'),
            const SizedBox(width: 20.0),
            _anyOption(Images.comment, '2'),
            const SizedBox(width: 22.0),
            _anyOption(Images.heartDigit, '2'),
            const SizedBox(width: 22.0),
            Expanded(child: _anyOption(Images.money, Strings.sendTip)),
            SvgPicture.asset(Images.fav),
          ],
        ),
        const SizedBox(height: 10.0),
        RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyText1!.color,
              fontSize: 11.0,
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
        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            // todo: this will change
            '2 days ago',
            style: TextStyle(fontSize: 9.0, color: Colors.grey),
          ),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }

  Widget _anyOption(String icon, String val) => Row(
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 4.0),
          Text(val, style: const TextStyle(fontSize: 11.0)),
        ],
      );
}
