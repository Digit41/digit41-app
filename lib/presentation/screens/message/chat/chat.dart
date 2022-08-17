import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import 'widgets/bubble_chat.dart';
import 'widgets/bubble_chat_menu.dart';
import 'widgets/reply.dart';
import 'widgets/success_msg_send_tip.dart';
import 'widgets/text_input_chat.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    BubbleChat(),
                    BubbleChatMenu(
                      child: BubbleChat(
                        send: false,
                        replyMessage: ReplyMessage(
                          false,
                          username: 'username',
                          message: 'message',
                        ),
                      ),
                    ),
                    BubbleChat(
                      replyMessage: ReplyMessage(
                        true,
                        username: 'username',
                        message: 'message',
                      ),
                    ),
                    BubbleChat(showRibbons: true, child: SuccessMsgSendTip())
                  ],
                ),
              ),
            ),
            // todo: EmptyMessage(),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Reply(title: 'username test', msg: 'reply test'),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: TextInputChat(),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() => AppBar(
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
      );
}
