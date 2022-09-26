import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holding_gesture/holding_gesture.dart';

import '../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../utils/app_theme.dart';

class AppEmojis extends StatelessWidget {
  late List<Emoji> emojiList;
  late ChatTextFieldCubit _chatTxtFieldCubit;

  AppEmojis({Key? key}) : super(key: key) {
    emojiList = Emoji.all();
  }

  @override
  Widget build(BuildContext context) {
    _chatTxtFieldCubit = context.read<ChatTextFieldCubit>();

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: context.watch<EmojisVisibilityCubit>().state
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 1.65,
                ),
                itemCount: emojiList.length,
                itemBuilder: (_, int index) => Center(
                  child: InkWell(
                    onTap: () {
                      _chatTxtFieldCubit.txtFieldOnChange(
                        emojiList[index].char,
                        append: true,
                      );
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
              height: 34.0,
              color: AppTheme.grey,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: HoldDetector(
                onHold: _chatTxtFieldCubit.backspace,
                onTap: _chatTxtFieldCubit.backspace,
                child: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
