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
  ChatTextFieldCubit() : super(ChatTextFieldSubmit());

  void writing() => emit(ChatTextFieldWriting());

  /// focus or waiting for user typing state is like submit state
  void submit() => emit(ChatTextFieldSubmit());

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

class ChatReplyCubit extends Cubit<ChatReplyState> {
  ChatReplyCubit() : super(ChatReplyHideState());

  void hide() => emit(ChatReplyHideState());

  void reply(String username, String msg) => emit(
        ChatReplyShowState(username, msg),
      );
}

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgCubit extends Cubit<ListOfChatMsgState> {
  ListOfChatMsgCubit() : super(ListOfChatMsgState());

  void addAMsg(String val) => emit(state.copyWith([...state.msgs, val]));
}
