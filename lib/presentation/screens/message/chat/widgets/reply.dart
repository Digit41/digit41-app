import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';

class Reply extends StatelessWidget {
  final String title;
  final String msg;

  const Reply({Key? key, required this.title, required this.msg})
      : super(key: key);

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
                    SvgPicture.asset(
                      Images.chatReply,
                      height: 18.0,
                      width: 18.0,
                    ),
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
              context.read<ChatReplyCubit>().hide();
            },
          ),
        ],
      ),
    );
  }
}
