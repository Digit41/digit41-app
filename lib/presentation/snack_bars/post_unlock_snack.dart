import 'package:flutter/material.dart';

import '../../utils/app_theme.dart';
import '../../utils/strings.dart';

class PostUnlockSnack extends StatelessWidget {
  final String postName;

  const PostUnlockSnack({Key? key, required this.postName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            padding: const EdgeInsets.all(5.0),
            child: const Icon(Icons.check, color: Colors.black),
          ),
          const SizedBox(width: 12.0),
          Expanded(
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
          ),
        ],
      ),
    );
  }
}
