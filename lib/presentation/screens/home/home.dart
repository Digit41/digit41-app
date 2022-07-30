import 'package:flutter/material.dart';

import 'custom_appbar.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: CustomScrollView(
        slivers: [
          const CustomAppbar(),
        ],
      ),
    );
  }
}
