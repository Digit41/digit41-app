import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:holding_gesture/holding_gesture.dart';

import '../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../utils/app_shared_preferences.dart';
import '../../../../utils/app_theme.dart';

class AppEmojis extends StatefulWidget {
  const AppEmojis({Key? key}) : super(key: key);

  @override
  State<AppEmojis> createState() => _AppEmojisState();
}

class _AppEmojisState extends State<AppEmojis> {
  final List<Widget> _cats = [];
  final List<List<Emoji>> _emojiList = [];
  final AppSharedPreferences _pref = AppSharedPreferences();

  final PageController _pageCtl = PageController();
  final ValueNotifier<int> _currentPage = ValueNotifier(0);

  late ChatTextFieldCubit _chatTxtFieldCubit;

  Future<void> _getRecentlyEmoji({bool setS = false}) async {
    List<Emoji> temp = [];
    List<String> recently = await _pref.getRecentlyEmojisClicked();
    for (var element in recently) temp.add(Emoji.byChar(element)!);

    if (setS) {
      _emojiList.removeAt(0);
      _emojiList.insert(0, temp);
      setState(() {});
    } else
      _emojiList.add(temp);
  }

  void _init() async {
    await _getRecentlyEmoji();
    _cats.add(_catIcon(0));

    for (int i = 0; i < EmojiGroup.values.length; i++) {
      _cats.add(_catIcon(i + 1));

      _emojiList.add(Emoji.byGroup(EmojiGroup.values[i]).toList());
    }
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  Widget _catIcon(int pIndex) => GestureDetector(
        onTap: () {
          _pageCtl.animateToPage(
            pIndex,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeIn,
          );
          _currentPage.value = pIndex;
        },
        child: ValueListenableBuilder(
          valueListenable: _currentPage,
          builder: (_, __, ___) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.category,
                  color: pIndex == _currentPage.value ? null : Colors.grey,
                ),
                const SizedBox(height: 6.0),
                Container(
                  width: 48.0,
                  height: 2.0,
                  color: pIndex == _currentPage.value
                      ? AppTheme.primaryColor
                      : null,
                ),
              ],
            ),
          ),
        ),
      );

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
            : 255.0,
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: AppTheme.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: _cats),
            ),
            Expanded(
              child: PageView(
                controller: _pageCtl,
                onPageChanged: (index) {
                  _currentPage.value = index;
                  if (index == 0) _getRecentlyEmoji(setS: true);
                },
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
                            _pref.holdEmojiClicked(_emojiList[i][index].char);
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
    );
  }
}
