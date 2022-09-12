import 'package:digit41/presentation/global_widgets/app_button.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme.dart';
import '../../../utils/strings.dart';
import '../../global_widgets/user_info.dart';
import '../post/widgets/any_post.dart';

class Subscription extends StatelessWidget {
  const Subscription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const UserInfo(showVerify: true),
              const SizedBox(height: 20.0),
              _info(),
              const SizedBox(height: 16.0),
              Text(
                'sdsdfsdfdfsdfds',
                style: TextStyle(fontSize: AppTheme.sFontSize),
              ),
              const SizedBox(height: 16.0),
              AppButton(title: Strings.subscribe, onTap: () {}),
              const SizedBox(height: 16.0),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (_, index) => AnyPost(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _info() => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _anyInfo('121', Strings.items),
            Container(color: Colors.grey, width: 1, height: 55.0),
            _anyInfo('121', Strings.subscribers),
            Container(color: Colors.grey, width: 1, height: 55.0),
            _anyInfo('121', 'DGT'),
          ],
        ),
      );

  Widget _anyInfo(String count, String title) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Column(
          children: [
            Text(count, style: TextStyle(fontSize: AppTheme.sFontSize)),
            const SizedBox(height: 2.0),
            Text(
              title,
              style: TextStyle(
                fontSize: AppTheme.sFontSize,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      );
}
