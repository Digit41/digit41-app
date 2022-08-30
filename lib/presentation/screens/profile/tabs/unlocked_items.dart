import 'package:flutter/material.dart';

import '../../post/widgets/any_post.dart';

class UnlockedItem extends StatelessWidget {
  const UnlockedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (_, index) => const AnyPost(unlocaked: true),
    );
  }
}
