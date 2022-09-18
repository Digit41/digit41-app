import 'package:flutter/material.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/strings.dart';
import 'my_items.dart';
import 'unlocked_items.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(color: AppTheme.grey, height: 2.0),
                ),
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  labelColor: Theme.of(context).textTheme.bodyText1!.color,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabs: const [
                    Tab(text: Strings.myItems),
                    Tab(text: Strings.unlocked),
                  ],
                ),
              ],
            ),
          ),
          const Expanded(
            child: TabBarView(children: [MyItems(), UnlockedItem()]),
          ),
        ],
      ),
    );
  }
}
