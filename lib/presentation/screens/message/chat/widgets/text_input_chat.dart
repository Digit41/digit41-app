import 'package:flutter/material.dart';
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
  late ListOfChatMsgCubit _msgsCubit;
  late ChatReplyCubit _replyCubit;

  TextInputChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _txtCubit = context.watch<ChatTextFieldCubit>();
    _msgsCubit = context.read<ListOfChatMsgCubit>();
    _replyCubit = context.read<ChatReplyCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _txtCubit.state.txtFieldController,
              maxLines: null,
              textInputAction: TextInputAction.send,
              onChanged: _txtCubit.txtFieldOnChange,
              textAlign: TextAlign.left,
              style: const TextStyle(height: 1.3),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
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
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    context.read<EmojisVisibilityCubit>().toggleVisibility();
                  },
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 50),
            child: _txtCubit.state is ChatTextFieldWriting
                ? _option(
                    Images.sendMsgTxt,
                    color: Theme.of(context).primaryColor,
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
    _txtCubit.submit();
    _msgsCubit.addAMsg(msg);
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
