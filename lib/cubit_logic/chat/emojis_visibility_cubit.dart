import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'emojis_visibility_state.dart';

class EmojisVisibilityCubit extends Cubit<EmojisVisibilityState> {
  EmojisVisibilityCubit() : super(EmojisVisibilityInVisible());

  void toggleVisibility() => emit(
        state is EmojisVisibilityInVisible
            ? EmojisVisibilityVisible()
            : EmojisVisibilityInVisible(),
      );
}
