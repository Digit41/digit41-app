part of 'chat_cubit.dart';

@immutable
abstract class EmojisVisibilityState {}

class EmojisVisibilityInVisible extends EmojisVisibilityState {}

class EmojisVisibilityVisible extends EmojisVisibilityState {}

@immutable
abstract class ChatTextFieldState extends Equatable {
  final TextEditingController txtFieldController = TextEditingController();
  final FocusNode txtFieldFocus = FocusNode();
}

class ChatTextFieldWriting extends ChatTextFieldState {
  @override
  List<Object?> get props => [];
}

class ChatTextFieldSubmit extends ChatTextFieldState {
  @override
  List<Object?> get props => [];
}

@immutable
abstract class ChatReplyEditState extends Equatable {}

class ChatReplyEditHideState extends ChatReplyEditState {
  @override
  List<Object?> get props => [];
}

class ChatReplyEditShowState extends ChatReplyEditState {
  //todo: may need refactor
  final String username;
  final String msg;

  final bool rep;

  ChatReplyEditShowState(this.username, this.msg, this.rep);

  @override
  List<Object?> get props => [username, msg, rep];
}

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgState {
  final List<String> msgs;

  ListOfChatMsgState({this.msgs = const []});

  ListOfChatMsgState copyWith(List<String> msgs) => ListOfChatMsgState(
        msgs: msgs,
      );
}
