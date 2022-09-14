import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';

class ReplyEdit extends StatelessWidget {
  final String title;
  final String msg;

  final bool rep;

  const ReplyEdit({
    Key? key,
    required this.title,
    required this.msg,
    this.rep = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: AppTheme.grey,
      ),
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    rep
                        ? SvgPicture.asset(
                            Images.chatReply,
                            height: 18.0,
                            width: 18.0,
                          )
                        : const Icon(Icons.edit, size: 16.0),
                    const SizedBox(width: 6.0),
                    Text(title),
                  ],
                ),
                const SizedBox(height: 4.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    msg,
                    style: TextStyle(
                      fontSize: AppTheme.sFontSize,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.clear, size: 18.0),
            onPressed: () {
              context.read<ChatReplyEditCubit>().hide();
              if (!rep)
                context
                    .read<ChatTextFieldCubit>()
                    .state
                    .txtFieldController
                    .text = '';
            },
          ),
        ],
      ),
    );
  }
}
