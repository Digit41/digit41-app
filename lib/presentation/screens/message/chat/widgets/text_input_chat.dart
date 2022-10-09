import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../cubit_logic/chat/chat_cubit.dart';
import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';
import '../../../../../utils/strings.dart';
import '../../../../global_widgets/app_bottom_sheet.dart';
import '../../../post/send_tip.dart';
import '../attach.dart';

class TextInputChat extends StatelessWidget {
  late ChatTextFieldCubit _txtCubit;
  late ChatReplyEditCubit _replyCubit;
  late EmojisVisibilityCubit _emojiCubit;

  TextInputChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _emojiCubit = context.read<EmojisVisibilityCubit>();
    _txtCubit = context.watch<ChatTextFieldCubit>();

    /// cubit must be [watch] for apply regex after edit a message or close it
    _replyCubit = context.watch<ChatReplyEditCubit>();

    /// persian regex
    RegExp regex = RegExp(
      r'^[\u0622\u0627\u0628\u067E\u062A-\u062C\u0686\u062D-\u0632\u0698\u0633-\u063A\u0641\u0642\u06A9\u06AF\u0644-\u0648\u06CC\u06F0-\u06F9]+$',
    );
    bool rtl = regex.hasMatch(_txtCubit.state.txtFieldController.text);

    _txtCubit.state.txtFieldFocus.addListener(() {
      if (_txtCubit.state.txtFieldFocus.hasFocus) _emojiCubit.inVisible();
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Expanded(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 110.0),
              child: Stack(
                children: [
                  ScrollConfiguration(
                    behavior: const MaterialScrollBehavior().copyWith(
                      overscroll: false,
                    ),
                    child: SingleChildScrollView(
                      reverse: true,
                      child: TextField(
                        controller: _txtCubit.state.txtFieldController,
                        focusNode: _txtCubit.state.txtFieldFocus,
                        textDirection:
                        rtl ? TextDirection.rtl : TextDirection.ltr,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onChanged: _txtCubit.txtFieldOnChange,
                        style: const TextStyle(height: 1.3),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(1.0),
                          border: const OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(8.0)),
                            borderSide: BorderSide(
                              width: 0.0,
                              style: BorderStyle.none,
                            ),
                          ),
                          hintText: Strings.typeMsg,
                          filled: true,
                          fillColor: AppTheme.grey,
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: AppTheme.sFontSize,
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.emoji_emotions_outlined,
                              color: Colors.transparent,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: kIsWeb ? 4.0 : 0.0,
                    child: IconButton(
                      icon: const Icon(
                        Icons.emoji_emotions_outlined,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        /// no way for unfocus chat txt field, like:
                        /// [_txtCubit.state.txtFieldFocus.unfocus();]
                        /// so have to use below command
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        _emojiCubit.toggleVisibility();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: _txtCubit.state is ChatTextFieldWriting
                ? _option(
              Images.sendMsgTxt,
              color: AppTheme.primaryColor,
              onTap: _submitMsg,
            )
                : Row(
              children: [
                _option(
                  Images.money,
                  onTap: () {
                    showGeneralBottomSheet(
                      context,
                      title: '${Strings.sendTip} ${Strings.to}',
                      child: SendTip(),
                    );
                  },
                ),
                const SizedBox(width: 8.0),
                _option(
                  Images.attachment,
                  onTap: () {
                    SystemChannels.textInput
                        .invokeMethod('TextInput.hide');
                    showGeneralBottomSheet(
                      context,
                      child: const Attach(),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _submitMsg() {
    String msg = _txtCubit.state.txtFieldController.text;
    _txtCubit.state.txtFieldController.clear();
    _txtCubit.submit(msg: msg);
    _replyCubit.hide();
  }

  Widget _option(String icon,
      {GestureTapCallback? onTap, Color color = AppTheme.grey}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 46.0,
          height: 46.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(icon),
        ),
      );
}
