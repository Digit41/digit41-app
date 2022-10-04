import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../cubit_logic/message/message_cubit.dart';
import '../../../utils/app_theme.dart';
import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/app_text_form_field.dart';
import 'widgets/any_chat_account.dart';

class Message extends StatelessWidget {
  final ScrollController? scrollCtl;

  Message({Key? key, this.scrollCtl}) : super(key: key);

  ///testi!
  final _accounts = [
    'Hossein',
    'Pooya',
    'sara',
    'akbar',
    'zahra',
    'okay',
    'yas',
    'Ali',
    'Ahmad'
  ];

  final _search = AppTextFormField(
    hint: Strings.searchForUser,
    prefixIcon: SvgPicture.asset(Images.searchUnselected, color: Colors.grey),
    hidePrefixAfterTyping: true,
  );

  @override
  Widget build(BuildContext context) {
    _search.onChanged = context.read<MessageCubit>().searchFieldOnChange;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
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
          BlocBuilder<MessageCubit, String>(
            builder: (_, state) {
              /// for test: todo: may need to refactor
              List<String> aList;
              if (state == '')
                aList = _accounts;
              else {
                aList = _accounts
                    .where((element) =>
                        element.toLowerCase().contains(state.toLowerCase()))
                    .toList();
                aList.sort((e1, e2) => e1.indexOf(state));
              }
              // todo: check empty message and show EmptyWidget
              return Expanded(
                child: aList.isEmpty
                    ? Center(child: Text('${Strings.notResult} "$state"'))
                    : ListView.separated(
                        /// needed key for rebuild and handle dismissible function of Slidable
                        /// also todo: itemCount must be have interaction because currently have error
                        key: UniqueKey(),
                        controller: scrollCtl,
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        itemBuilder: (_, int index) => AnyChatAccount(
                          name: aList[index],
                          query: state,
                        ),
                        separatorBuilder: (_, int index) => const Divider(
                          height: 0.0,
                        ),
                        itemCount: aList.length,
                      ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        mini: true,
        backgroundColor: AppTheme.primaryColor,
        child: const Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
