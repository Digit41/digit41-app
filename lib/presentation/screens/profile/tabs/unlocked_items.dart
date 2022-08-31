import 'package:flutter/material.dart';

import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../global_widgets/app_button.dart';
import '../../post/widgets/any_post.dart';

class UnlockedItem extends StatelessWidget {
  const UnlockedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true
        ? _empty(context)
        : ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: 10,
            itemBuilder: (_, index) => const AnyPost(unlocaked: true),
          );
  }

  Widget _empty(BuildContext context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.moon, width: 110.0, height: 110.0),
            const SizedBox(height: 12.0),
            const Text(
              Strings.emptyUnlockItem,
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: AppButton(
                title: Strings.explore,
                onTap: () {},
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      );
}
