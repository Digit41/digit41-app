import 'package:digit41/presentation/global_widgets/app_button.dart';
import 'package:digit41/presentation/global_widgets/app_text_form_field.dart';
import 'package:digit41/presentation/global_widgets/user_info.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/strings.dart';

class SendTip extends StatelessWidget {
  final _formKay = GlobalKey<FormState>();
  final AppTextFormField _amount = AppTextFormField(
    hint: '${Strings.amountOf} DGT',
    textInputType: TextInputType.number,
  );
  final AppTextFormField _note = AppTextFormField(
    hint: '${Strings.note} ( ${Strings.optional} )',
    maxLine: 3,
  );

  SendTip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8.0),
        const UserInfo(),
        const SizedBox(height: 24.0),
        Form(key: _formKay, child: _amount),
        const SizedBox(height: 8.0),
        Text(
          '${Strings.balance}: 54 DGT',
          style: TextStyle(color: Colors.grey, fontSize: AppTheme.sFontSize),
        ),
        const SizedBox(height: 16.0),
        _note,
        const SizedBox(height: 32.0),
        AppButton(title: Strings.pay, onTap: () {}),
      ],
    );
  }
}
