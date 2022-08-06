import 'package:flutter/material.dart';

import '../post/widgets/any_post.dart';
import 'widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const CustomAppbar(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, index) => AnyPost(),
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
