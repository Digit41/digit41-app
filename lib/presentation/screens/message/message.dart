import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_button.dart';
import '../../global_widgets/app_text_form_field.dart';
import 'widgets/any_chat_account.dart';

class Message extends StatelessWidget {
  Message({Key? key}) : super(key: key);

  final _search = AppTextFormField(
    hint: Strings.searchForUser,
    prefixIcon: SvgPicture.asset(
      Images.searchUnselected,
      width: 18.0,
      height: 18.0,
      color: Colors.grey,
    ),
    hidePrefixAfterTyping: true,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32.0),
          Text(Strings.messages,
              style: TextStyle(fontSize: AppTheme.lFontSize)),
          const SizedBox(height: 8.0),
          _search,
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 32.0),
              itemBuilder: (_, int index) => const AnyChatAccount(),
              separatorBuilder: (_, int index) => const Divider(height: 20.0),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _emptyMessages() => Column(
        children: [
          const SizedBox(height: 72.0),
          Center(
            child: Image.asset(Images.astronaut, width: 220.0, height: 220.0),
          ),
          const Center(
            child: Text(
              Strings.dontHaveAnyMess,
              style: TextStyle(color: Colors.grey),
            ),
          ),
          const SizedBox(height: 32.0),
          AppButton(title: Strings.startConversation, onTap: () {}),
        ],
      );
}
