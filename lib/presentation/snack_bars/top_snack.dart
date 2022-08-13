import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/strings.dart';

class _BaseTopSnack extends StatelessWidget {
  final Widget child;
  final Widget icon;
  final Color backgroundColorIcon;

  const _BaseTopSnack({
    Key? key,
    required this.child,
    required this.icon,
    this.backgroundColorIcon = AppTheme.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: backgroundColorIcon,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(4.0),
            child: icon,
          ),
          const SizedBox(width: 12.0),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class PostUnlockSnack extends StatelessWidget {
  final String postName;

  const PostUnlockSnack({Key? key, required this.postName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseTopSnack(
      icon: const Icon(Icons.check, color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${Strings.congrats}!',
            style: Theme.of(context).textTheme.bodyText2?.merge(
                  TextStyle(
                    fontSize: AppTheme.mFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
          ),
          const SizedBox(height: 3.0),
          Text(
            '${Strings.item} $postName ${Strings.successfully} ${Strings.unlocked}',
            style: Theme.of(context).textTheme.bodyText2?.merge(
                  const TextStyle(color: Colors.grey),
                ),
          ),
        ],
      ),
    );
  }
}

class ChatDeletedSnack extends StatelessWidget {
  const ChatDeletedSnack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BaseTopSnack(
      icon: const Icon(Icons.clear, color: Colors.black),
      backgroundColorIcon: Colors.red,
      child: Text(
        Strings.chatDeleted,
        style: Theme.of(context).textTheme.bodyText2?.merge(
              const TextStyle(color: Colors.black),
            ),
      ),
    );
  }
}
