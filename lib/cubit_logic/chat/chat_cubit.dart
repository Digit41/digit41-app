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
  ChatTextFieldCubit() : super(ChatTextFieldInitial());

  void writing() => emit(ChatTextFieldWriting());

  void submit() => emit(ChatTextFieldSubmit());
}
