import 'package:emojis/emoji.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class EmojisVisibilityCubit extends Cubit<EmojisVisibilityState> {
  EmojisVisibilityCubit() : super(EmojisVisibilityInVisible());

  void toggleVisibility() => state is EmojisVisibilityInVisible
      ? emit(EmojisVisibilityVisible())
      : emit(EmojisVisibilityInVisible());

  void inVisible() => emit(EmojisVisibilityInVisible());
}

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgCubit extends Cubit<ListOfChatMsgState> {
  ListOfChatMsgCubit() : super(ListOfChatMsgState());

  void addAMsg(String val) => emit(state.copyWith([...state.msgs, val]));

  void editAMsg(int msgIndex, String newMsg) {
    state.msgs[msgIndex] = newMsg;
    emit(state.copyWith(state.msgs));
  }

  void deleteAMsg(int index) {
    state.msgs.removeAt(index);
    emit(state.copyWith(state.msgs));
  }
}

class ChatTextFieldCubit extends Cubit<ChatTextFieldState> {
  /// we can have a use case that [txtFieldOnChange] and [backspace]
  /// functions be into so that logic becomes more separate

  final ListOfChatMsgCubit _msgList;

  int? tempEditMsgIndex;

  ChatTextFieldCubit(this._msgList) : super(ChatTextFieldSubmit());

  void writing() => emit(ChatTextFieldWriting());

  /// focus or waiting for user typing state is like submit state
  void submit({String? msg}) {
    if (msg != null && tempEditMsgIndex == null)
      _msgList.addAMsg(msg);
    else if (msg != null && tempEditMsgIndex != null) {
      _msgList.editAMsg(tempEditMsgIndex!, msg);
      tempEditMsgIndex = null;
    }

    emit(ChatTextFieldSubmit());
  }

  void editChatMsg(int msgIndex) {
    /// It's really important that the switch to new state[write], comes before any code
    /// else your code's may not have correct operation
    writing();

    tempEditMsgIndex = msgIndex;
    state.txtFieldController.text = _msgList.state.msgs[msgIndex];
    state.txtFieldFocus.requestFocus();
  }

  String? txtFieldOnChange(String txt, {bool append = false}) {
    if (txt.isNotEmpty)
      writing();
    else
      submit();

    if (append) {
      /// this command needed because with remove emoji or add it, cursor jumps
      state.txtFieldFocus.unfocus();

      state.txtFieldController.text += txt;
    } else
      state.txtFieldController.text = txt;

    state.txtFieldController.selection =
        TextSelection.fromPosition(TextPosition(offset: txt.length));

    return txt;
  }

  void backspace() {
    String txt = state.txtFieldController.text;

    if (txt.isEmpty) return;

    /// this condition is because of that any emoji char is with length 2
    /// also this emoji char can be any position of typed user message
    /// so must check, latest chars is emoji or not
    if (txt.length > 1 && Emoji.byChar(txt.substring(txt.length - 2)) != null)
      txt = txt.substring(0, txt.length - 2);
    else
      txt = txt.substring(0, txt.length - 1);

    state.txtFieldController.text = txt;

    if (!kIsWeb)
      state.txtFieldController.selection =
          TextSelection.fromPosition(TextPosition(offset: txt.length));

    if (txt.isEmpty) submit();
  }

  @override
  Future<void> close() {
    state.txtFieldFocus.dispose();
    state.txtFieldController.dispose();
    return super.close();
  }
}

class ChatReplyEditCubit extends Cubit<ChatReplyEditState> {
  ChatReplyEditCubit() : super(ChatReplyEditHideState());

  void hide() => emit(ChatReplyEditHideState());

  void replyEdit(String username, String msg, {bool rep = true}) => emit(
        ChatReplyEditShowState(username, msg, rep),
      );
}
