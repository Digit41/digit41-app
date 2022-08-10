import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import 'widgets/bubble_chat.dart';
import 'widgets/bubble_chat_menu.dart';
import 'widgets/reply.dart';
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
        titleSpacing: 0.0,
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
            BubbleChat(),
            BubbleChatMenu(child: BubbleChat(send: false)),
            // todo: EmptyMessage(),
            Spacer(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Reply(title: 'scsdfsd', msg: 'sdsfsdf'),
            ),
            SizedBox(height: 8.0),
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
