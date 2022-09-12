import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import 'widgets/bubble_chat.dart';
import 'widgets/reply.dart';
import 'widgets/success_msg_send_tip.dart';
import 'widgets/text_input_chat.dart';

class Chat extends StatelessWidget {
  late List<Emoji> emojiList;

  Chat({Key? key}) : super(key: key) {
    emojiList = Emoji.all();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<EmojisVisibilityCubit>(
              create: (_) => EmojisVisibilityCubit(),
            ),
            BlocProvider<ChatTextFieldCubit>(
                create: (_) => ChatTextFieldCubit()),
          ],
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      BubbleChat(),
                      BubbleChat(
                        sent: false,
                        replyMessage: ReplyMessage(
                          false,
                          username: 'username',
                          message: 'message',
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
              Align(
                alignment: Alignment.bottomCenter,
                child: TextInputChat(),
              ),
              _emojis(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar() => AppBar(
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
                Text('Hossein', style: TextStyle(fontSize: AppTheme.mFontSize)),
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

  Widget _emojis() => Builder(
        builder: (ctx) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: ctx.watch<EmojisVisibilityCubit>().state
                      is EmojisVisibilityInVisible
                  ? 0.0
                  : 180.0,
              decoration: const BoxDecoration(
                color: AppTheme.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              padding: const EdgeInsets.only(top: 16.0),
              child: GridView.builder(
                controller: ScrollController(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 1.65,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ),
                itemCount: emojiList.length,
                itemBuilder: (_, int index) => InkWell(
                  onTap: () {
                    var c = ctx.read<ChatTextFieldCubit>();
                    c.writing();
                    c.state.txtFieldController.text += emojiList[index].char;
                  },
                  child: Text(
                    emojiList[index].char,
                    style: const TextStyle(fontSize: 26.0),
                  ),
                ),
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  left: MediaQuery.of(ctx).size.width * 0.08,
                ),
              ),
            ),
          );
        },
      );
}
