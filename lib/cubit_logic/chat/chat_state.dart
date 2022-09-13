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

/// for test and temporary, Todo: must be refactor
class ListOfChatMsgState {
  List<String> msgs = [];

  ListOfChatMsgState copyWith(List<String> msgs) {
    var l = ListOfChatMsgState();
    l.msgs = msgs;
    return l;
  }
}
