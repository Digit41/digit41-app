import 'package:emojis/emoji.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class EmojisVisibilityCubit extends Cubit<EmojisVisibilityState> {
  EmojisVisibilityCubit() : super(EmojisVisibilityInVisible());

  void toggleVisibility() => emit(
        state is EmojisVisibilityInVisible
            ? EmojisVisibilityVisible()
            : EmojisVisibilityInVisible(),
      );
}

class ChatTextFieldCubit extends Cubit<ChatTextFieldState> {
  /// we can have a use case that [txtFieldOnChange] and [backspace]
  /// functions be into so that logic becomes more separate

  ChatTextFieldCubit() : super(ChatTextFieldSubmit());

  void writing() => emit(ChatTextFieldWriting());

  /// focus or waiting for user typing state is like submit state
  void submit() => emit(ChatTextFieldSubmit());

  void editChatMsg(String val) {
    /// It's really important that the switch to new state[write], comes before any code
    /// else your code's may not have correct operation
    writing();

    state.txtFieldController.text = val;
    state.txtFieldFocus.requestFocus();
  }

  String? txtFieldOnChange(String txt) {
    if (txt.isNotEmpty)
      writing();
    else
      submit();
    state.txtFieldController.text = txt;
    state.txtFieldController.selection =
        TextSelection.fromPosition(TextPosition(offset: txt.length));
    return null;
  }

  void backspace() {
    String txt = state.txtFieldController.text;

    /// this condition is because of that any emoji char is with length 2
    /// also this emoji char can be any position of typed user message
    /// so must check, latest chars is emoji or not
    if (txt.length > 1 && Emoji.byChar(txt.substring(txt.length - 2)) != null)
      txt = txt.substring(0, txt.length - 2);
    else
      txt = txt.substring(0, txt.length - 1);

    state.txtFieldController.text = txt;
    if (txt.isEmpty) submit();
  }
}

class ChatReplyEditCubit extends Cubit<ChatReplyEditState> {
  ChatReplyEditCubit() : super(ChatReplyEditHideState());

  void hide() => emit(ChatReplyEditHideState());

  void replyEdit(String username, String msg, {bool rep = true}) => emit(
        ChatReplyEditShowState(username, msg, rep),
      );
}

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgCubit extends Cubit<ListOfChatMsgState> {
  ListOfChatMsgCubit() : super(ListOfChatMsgState());

  void addAMsg(String val) => emit(state.copyWith([...state.msgs, val]));
}
