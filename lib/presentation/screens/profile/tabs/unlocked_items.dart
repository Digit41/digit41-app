import 'package:flutter/material.dart';

import '../../../../utils/strings.dart';
import '../../post/widgets/any_post.dart';
import 'empty_tab.dart';

class UnlockedItem extends StatelessWidget {
  const UnlockedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return true
        ? EmptyTab(
            msg: Strings.emptyUnlockItem,
            btnTitle: Strings.explore,
            onTap: () {},
          )
        : ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: 10,
            itemBuilder: (_, index) => const AnyPost(unlocaked: true),
          );
  }
}
