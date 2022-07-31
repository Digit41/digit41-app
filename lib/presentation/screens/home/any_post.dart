import 'package:blur/blur.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_button.dart';

class AnyPost extends StatelessWidget {
  const AnyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  // todo: this will change
                  'Abo ghanbari',
                  style: const TextStyle(fontSize: 12.0),
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
                          fontSize: 10.0,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      // todo: this will change
                      'sofdo.com',
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 260.0,
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              Blur(
                blur: 10.0,
                blurColor: Colors.grey,
                // todo: this will change
                child: FlutterLogo(
                  size: 260.0,
                ),
              ),
              Positioned(
                top: 80.0,
                left: 0.0,
                right: 0.0,
                child: SvgPicture.asset(Images.lock),
              ),
              Positioned(
                bottom: 8.0,
                width: MediaQuery.of(context).size.width - 80.0,
                child: AppButton(
                  onTap: () {},
                  color: Theme.of(context).textTheme.bodyText1!.color,
                  title: '${Strings.unlockFor} 3 DGT',
                  titleSize: 11.0,
                  extra: Padding(
                    padding: const EdgeInsets.only(top: 5.0),
                    child: Text(
                      // todo: this will change
                      'ETH 0.5',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 8.0,
                      ),
                    ),
                  ),
                  icon: SvgPicture.asset(
                    Images.smallBlackDigit,
                    height: 20.0,
                    width: 20.0,
                  ),
                  spaceBetween: false,
                ),
              ),
            ],
          ),
        ),
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
