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
abstract class ChatReplyState extends Equatable {}

class ChatReplyHideState extends ChatReplyState {
  @override
  List<Object?> get props => [];
}

class ChatReplyShowState extends ChatReplyState {
  //todo: may need refactor
  final String username;
  final String msg;

  ChatReplyShowState(this.username, this.msg);

  @override
  List<Object?> get props => [username, msg];
}

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgState {
  final List<String> msgs;

  ListOfChatMsgState({this.msgs = const []});

  ListOfChatMsgState copyWith(List<String> msgs) => ListOfChatMsgState(
        msgs: msgs,
      );
}
