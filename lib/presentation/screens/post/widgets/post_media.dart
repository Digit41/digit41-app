import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../global_widgets/app_button.dart';

class PostMedia extends StatelessWidget {
  final GestureTapCallback? btnOnTap;
  final double width;
  final double height;
  final bool unlocked;

  const PostMedia({
    Key? key,
    this.btnOnTap,
    this.width = double.infinity,
    this.height = 260.0,
    this.unlocked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          if (unlocked)
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: Image.network(
                'https://s6.uupload.ir/files/image_klio.png',
                fit: BoxFit.fill,
              ),
            ),
          if (unlocked)
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 10.0,
              ),
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(Images.unlocked),
            ),
          if (!unlocked)
            Blur(
              blurColor: Colors.grey,
              borderRadius: BorderRadius.circular(6.0),
              // todo: this will change
              child:
                  Image.network('https://s6.uupload.ir/files/image_klio.png'),
            ),
          if (!unlocked)
            Positioned(
              top: btnOnTap == null ? height / 2.3 : 80.0,
              left: 0.0,
              right: 0.0,
              child: SvgPicture.asset(Images.lock),
            ),
          if (btnOnTap != null && !unlocked)
            Positioned(
              bottom: 8.0,
              width: MediaQuery.of(context).size.width - 80.0,
              child: AppButton(
                onTap: btnOnTap!,
                color: Theme.of(context).textTheme.bodyText1!.color,
                title: '${Strings.unlockFor} 3 DGT',
                titleSize: 11.0,
                extra: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    // todo: this will change
                    'ETH 0.5',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppTheme.ssFontSize,
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
    );
  }
}
