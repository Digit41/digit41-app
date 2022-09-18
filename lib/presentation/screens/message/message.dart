import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_text_form_field.dart';
import 'widgets/any_chat_account.dart';

class Message extends StatelessWidget {
  Message({Key? key}) : super(key: key);

  final _search = AppTextFormField(
    hint: Strings.searchForUser,
    prefixIcon: SvgPicture.asset(Images.searchUnselected, color: Colors.grey),
    hidePrefixAfterTyping: true,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: kIsWeb ? 32.0 : 55.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              Strings.messages,
              style: TextStyle(fontSize: AppTheme.lFontSize),
            ),
          ),
          const SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: _search,
          ),
          // todo: check empty message and show EmptyWidget
          Expanded(
            child: ListView.separated(

              /// needed key for rebuild and handle dismissible function of Slidable
              /// also todo: itemCount must be have interaction because currently have error
              key: UniqueKey(),
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              itemBuilder: (_, int index) => const AnyChatAccount(),
              separatorBuilder: (_, int index) => const Divider(height: 0.0),
              itemCount: 10,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: Theme.of(context).primaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
