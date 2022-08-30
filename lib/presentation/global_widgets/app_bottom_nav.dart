import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_theme.dart';
import '../../utils/images_path.dart';
import '../screens/home/home.dart';
import '../screens/message/message.dart';
import '../screens/profile/profile.dart';

class AppBottomNav extends StatefulWidget {
  const AppBottomNav({Key? key}) : super(key: key);

  @override
  State<AppBottomNav> createState() => _AppBottomNavState();
}

class _AppBottomNavState extends State<AppBottomNav> {
  int _bottomItemSelectedIndex = 0;

  final pages = [
    const Home(),
    Container(),
    Container(),
    Message(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_bottomItemSelectedIndex],
      bottomNavigationBar: Theme(
        data: AppTheme.theme,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _bottomItemSelectedIndex,
          onTap: (newIndex) {
            setState(() {
              _bottomItemSelectedIndex = newIndex;
            });
          },
          items: [
            _item(
              Images.homeSelected,
              Images.homeUnselected,
              selected: _bottomItemSelectedIndex == 0,
            ),
            _item(
              Images.searchSelected,
              Images.searchUnselected,
              selected: _bottomItemSelectedIndex == 1,
            ),
            _item(
              Images.addPostSelected,
              Images.addPostUnselected,
              selected: _bottomItemSelectedIndex == 2,
            ),
            _item(
              Images.messageSelected,
              Images.messageUnselected,
              selected: _bottomItemSelectedIndex == 3,
            ),
            _item(
              Images.accountSelected,
              Images.accountUnselected,
              selected: _bottomItemSelectedIndex == 4,
            ),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _item(String iconSelected, String iconUnselected,
      {bool selected = false}) =>
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: SvgPicture.asset(selected ? iconSelected : iconUnselected),
        ),
        label: '',
      );
}
