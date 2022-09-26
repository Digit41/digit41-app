import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/highlight_occurrences.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';
import '../../../../utils/utils.dart';
import '../../../snack_bars/top_snack.dart';
import '../chat/chat.dart';

class AnyChatAccount extends StatelessWidget {
  final String name;
  final String query;

  const AnyChatAccount({
    Key? key,
    required this.name,
    this.query = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const ScrollMotion(),
        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(onDismissed: () {
          showTopSnackBar(context, const ChatDeletedSnack());
        }),
        children: [
          SlidableAction(
            onPressed: (_) {
              showTopSnackBar(context, const ChatDeletedSnack());
            },
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: Strings.delete,
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          navigateToPage(context, const Chat());
        },
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 2.0,
        ),
        leading: SvgPicture.asset(Images.chatAccountDefault),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                children: highlightOccurrences(name, query),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            Text(
              '12:21 AM',
              style: TextStyle(
                color: Colors.grey,
                fontSize: AppTheme.sFontSize,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'sffsdfsfwefewfewfefwefewfewjfhwefjrnjkrngnbrejhgjerbgbhrejbghjbrgh',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: AppTheme.sFontSize,
                  ),
                ),
              ),
              const SizedBox(width: 32.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.red,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 2.0,
                  horizontal: 4.9,
                ),
                margin: const EdgeInsets.only(bottom: 2.5),
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppTheme.sFontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
