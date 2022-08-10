import 'package:digit41/presentation/snack_bars/bottom_snack.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';
import '../../../../../utils/strings.dart';
import '../../../../global_widgets/focused_menu.dart';

class BubbleChatMenu extends StatelessWidget {
  final Widget child;

  const BubbleChatMenu({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FocusedMenuHolder(
      onPressed: () {},
      menuWidth: 175.0,
      blurSize: 5.0,
      menuItemExtent: 40.0,
      duration: const Duration(milliseconds: 100),
      animateMenuItems: true,
      blurBackgroundColor: Colors.grey,
      openWithTap: true,
      // Open Focused-Menu on Tap rather than Long Press
      menuOffset: 16.0,
      // Offset value to show menuItem from the selected item
      // bottomOffsetHeight: 80.0,
      // Offset height to consider, for showing the menu item ( for example bottom navigation bar), so that the popup menu will be shown on top of selected item.
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            Strings.reply,
            style: TextStyle(fontSize: AppTheme.sFontSize),
          ),
          trailingIcon: SvgPicture.asset(Images.chatReply),
          onPressed: () {},
        ),
        FocusedMenuItem(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            Strings.copyTxt,
            style: TextStyle(fontSize: AppTheme.sFontSize),
          ),
          trailingIcon: const Icon(Icons.copy, size: 16.0),
          onPressed: () {
            Clipboard.setData(const ClipboardData(text: 'sfdf')).then((value) {
              ScaffoldMessenger.of(context).showSnackBar(
                showSnack(
                  txt: Strings.copied,
                  icon: const Icon(Icons.copy, size: 18.0),
                ),
              );
            });
          },
        ),
      ],
      child: child,
    );
  }
}
