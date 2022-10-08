import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holding_gesture/holding_gesture.dart';

import '../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../utils/app_theme.dart';

class AppEmojis extends StatelessWidget {
  final List<Widget> _cats = [];
  final List<List<Emoji>> _emojiList = [];
  late ChatTextFieldCubit _chatTxtFieldCubit;

  AppEmojis({Key? key}) : super(key: key) {
    for (int i = 0; i < EmojiGroup.values.length; i++) {
      _cats.add(
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.category),
        ),
      );

      _emojiList.add(Emoji.byGroup(EmojiGroup.values[i]).toList());
    }
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
            : 250.0,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: AppTheme.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: DefaultTabController(
          length: EmojiGroup.values.length,
          child: Column(
            children: [
              TabBar(
                isScrollable: true,
                labelPadding: EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                unselectedLabelColor: Colors.grey,
                labelColor: Theme.of(context).textTheme.bodyText1!.color,
                indicatorColor: AppTheme.primaryColor,
                tabs: _cats,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    for (int i = 0; i < _emojiList.length; i++)
                      GridView.builder(
                        controller: ScrollController(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 6,
                          childAspectRatio: 1.6,
                        ),

                        /// [i] is page index
                        itemCount: _emojiList[i].length,
                        itemBuilder: (_, int index) => Center(
                          child: InkWell(
                            onTap: () {
                              _chatTxtFieldCubit.txtFieldOnChange(
                                _emojiList[i][index].char,
                                append: true,
                              );
                            },
                            child: Text(
                              _emojiList[i][index].char,
                              style: const TextStyle(fontSize: 26.0),
                            ),
                          ),
                        ),
                        shrinkWrap: true,
                        padding: const EdgeInsets.only(top: 4.0),
                      ),
                  ],
                ),
              ),
              Container(
                height: 34.0,
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
      ),
    );
  }
}
