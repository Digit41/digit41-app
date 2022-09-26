import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../global_widgets/app_bottom_sheet.dart';
import 'app_emojis.dart';
import 'widgets/bubble_chat.dart';
import 'widgets/reply_edit.dart';
import 'widgets/success_msg_send_tip.dart';
import 'widgets/text_input_chat.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<EmojisVisibilityCubit>(
              create: (_) => EmojisVisibilityCubit(),
            ),
            BlocProvider<ListOfChatMsgCubit>(
              create: (_) => ListOfChatMsgCubit(),
            ),
            BlocProvider<ChatTextFieldCubit>(
              create: (ctx) => ChatTextFieldCubit(ctx.read()),
            ),
            BlocProvider<ChatReplyEditCubit>(
              create: (_) => ChatReplyEditCubit(),
            ),
          ],
          child: _body(),
        ),
      ),
    );
  }

  PreferredSizeWidget _appbar(BuildContext context) => AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showGeneralBottomSheet(context);
            },
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

  Widget _body() => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const BubbleChat(msgIndex: 100, msg: 'okk test'),
                  const BubbleChat(
                    msgIndex: 100,
                    sent: false,
                    msg: 'response test ok',
                    replyMessage: ReplyMessage(
                      false,
                      username: 'username',
                      message: 'message',
                    ),
                  ),
                  const BubbleChat(
                    msgIndex: 100,
                    replyMessage: ReplyMessage(
                      true,
                      username: 'username',
                      message: 'message',
                    ),
                  ),
                  const BubbleChat(
                    msgIndex: 100,
                    showRibbons: true,
                    child: SuccessMsgSendTip(),
                  ),

                  /// for test, Todo: must be delete or refactor(also above codes)
                  BlocBuilder<ListOfChatMsgCubit, ListOfChatMsgState>(
                    builder: (ctx, state) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.msgs.length,
                        itemBuilder: (_, index) => BubbleChat(
                          msgIndex: index,
                          msg: state.msgs[index],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          // todo: EmptyMessage(),
          BlocBuilder<ChatReplyEditCubit, ChatReplyEditState>(
            builder: (_, state) => state is ChatReplyEditHideState
                ? const Center()
                : Align(
                    alignment: Alignment.bottomCenter,
                    child: ReplyEdit(
                      title: (state as ChatReplyEditShowState).username,
                      msg: state.msg,
                      rep: state.rep,
                    ),
                  ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 4.0),
            child: TextInputChat(),
          ),
          AppEmojis(),
        ],
      );
}
