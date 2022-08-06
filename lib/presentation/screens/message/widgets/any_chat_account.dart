import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';

class AnyChatAccount extends StatelessWidget {
  const AnyChatAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(Images.chatAccountDefault),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Hossein Asadi'),
          const SizedBox(height: 4.0),
          Text(
            'sffsdfsfwefewfewfefwefewfewjfhwefjrnjkrngnbrejhgjerbgbhrejbghjbrgh',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Colors.grey, fontSize: AppTheme.sFontSize),
          ),
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            '12:21 AM',
            style: TextStyle(color: Colors.grey, fontSize: AppTheme.sFontSize),
          ),
          const SizedBox(height: 6.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.red,
            ),
            padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 5.0),
            margin: const EdgeInsets.only(bottom: 2.5),
            child: Text(
              '2',
              style: TextStyle(
                color: Colors.white,
                fontSize: AppTheme.sFontSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
