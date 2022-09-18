import 'package:flutter/material.dart';

import '../post/widgets/any_post.dart';
import 'widgets/custom_appbar.dart';

class Home extends StatelessWidget {
  final ScrollController? sc;

  const Home({Key? key, this.sc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: sc,
      slivers: [
        const CustomAppbar(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (_, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: AnyPost(),
            ),
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
