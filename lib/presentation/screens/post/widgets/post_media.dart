import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../global_widgets/app_bottom_sheet.dart';
import '../../../global_widgets/app_button.dart';

class PostMedia extends StatelessWidget {
  final bool withBtn;
  final double width;
  final double height;

  const PostMedia(
      {Key? key,
      this.withBtn = true,
      this.width = double.infinity,
      this.height = 260.0})
      : super(key: key);

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
          Blur(
            blur: 10.0,
            blurColor: Colors.grey,
            // todo: this will change
            child: FlutterLogo(
              size: height,
            ),
          ),
          Positioned(
            top: 80.0,
            left: 0.0,
            right: 0.0,
            child: SvgPicture.asset(Images.lock),
          ),
          if (withBtn)
            Positioned(
              bottom: 8.0,
              width: MediaQuery.of(context).size.width - 80.0,
              child: AppButton(
                onTap: () {
                  showGeneralBottomSheet(context, title: 'unn');
                },
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
    );
  }
}
