import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../widgets/empty_message.dart';
import 'widgets/text_input_chat.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(size: 14.0),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(Images.chatMenu),
          ),
        ],
        title: Row(
          children: [
            SvgPicture.asset(
              Images.chatAccountDefault,
              width: 30.0,
              height: 30.0,
            ),
            const SizedBox(width: 8.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hossein', style: TextStyle(fontSize: AppTheme.sFontSize)),
                Text(
                  'online',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: AppTheme.sFontSize,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: const [
            EmptyMessage(),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: TextInputChat(),
            ),
            SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
