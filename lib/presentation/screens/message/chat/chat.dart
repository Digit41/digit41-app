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
              create: (_) => ChatTextFieldCubit(),
            ),
            BlocProvider<ListOfChatMsgCubit>(
              create: (_) => ListOfChatMsgCubit(),
            ),
          ],
          child: _body(),
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

  Widget _body() => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Column(
                children: [
                  const BubbleChat(),
                  const BubbleChat(
                    sent: false,
                    replyMessage: ReplyMessage(
                      false,
                      username: 'username',
                      message: 'message',
                    ),
                  ),
                  const BubbleChat(
                    replyMessage: ReplyMessage(
                      true,
                      username: 'username',
                      message: 'message',
                    ),
                  ),
                  const BubbleChat(
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
      );

  Widget _emojis() => Builder(
        builder: (ctx) {
          var txtFieldCubit = ctx.read<ChatTextFieldCubit>();

          return Align(
            alignment: Alignment.bottomCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              height: ctx.watch<EmojisVisibilityCubit>().state
                      is EmojisVisibilityInVisible
                  ? 0.0
                  : 190.0,
              decoration: const BoxDecoration(
                color: AppTheme.grey,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: ScrollController(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 6,
                        childAspectRatio: 1.65,
                        mainAxisSpacing: 10.0,
                        crossAxisSpacing: 10.0,
                      ),
                      itemCount: emojiList.length,
                      itemBuilder: (_, int index) => Center(
                        child: InkWell(
                          onTap: () {
                            txtFieldCubit.writing();
                            txtFieldCubit.state.txtFieldController.text +=
                                emojiList[index].char;
                          },
                          child: Text(
                            emojiList[index].char,
                            style: const TextStyle(fontSize: 26.0),
                          ),
                        ),
                      ),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(
                        top: 8.0,
                        left: 4.0,
                        right: 4.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 32.0,
                    color: AppTheme.grey,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: InkWell(
                      onTap: txtFieldCubit.backspace,
                      child: const Icon(
                        Icons.backspace_outlined,
                        size: 18.0,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
