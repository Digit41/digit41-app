import 'package:flutter_bloc/flutter_bloc.dart';

part 'message_state.dart';

/// for test and will be refactor
class MessageCubit extends Cubit<String> {
  MessageCubit() : super('');

  String? searchFieldOnChange(String val) {
    emit(val);
    return val;
  }
}
