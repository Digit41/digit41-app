import 'package:flutter/material.dart';

import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../global_widgets/app_button.dart';

class EmptyMessage extends StatelessWidget {
  final GestureTapCallback? onTap;

  const EmptyMessage({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 72.0),
        Center(
          child: Image.asset(Images.astronaut, width: 220.0, height: 220.0),
        ),
        const Center(
          child: Text(
            Strings.dontHaveAnyMess,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        const SizedBox(height: 32.0),
        if (onTap != null)
          AppButton(
            title: Strings.startConversation,
            onTap: onTap!,
          ),
      ],
    );
  }
}
