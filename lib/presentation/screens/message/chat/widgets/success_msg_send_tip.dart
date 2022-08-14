import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';
import '../../../../../utils/strings.dart';

class SuccessMsgSendTip extends StatelessWidget {
  const SuccessMsgSendTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 48.0),
        Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              Images.smallBlackDigit,
              width: 35.0,
              height: 35.0,
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(top: 4.0),
              child: const Icon(
                Icons.check,
                color: Colors.black,
                size: 20.0,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(
          Strings.successful,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: AppTheme.sFontSize,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          '${Strings.youSend} 1.2 DGT ${Strings.to} Abo ghanbari',
          style: TextStyle(
            color: Colors.grey,
            fontSize: AppTheme.ssFontSize,
          ),
        ),
      ],
    );
  }
}
