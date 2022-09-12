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
