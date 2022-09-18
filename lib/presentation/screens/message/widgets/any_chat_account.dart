import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/highlight_occurrences.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/utils.dart';
import '../../../snack_bars/top_snack.dart';
import '../chat/chat.dart';

class AnyChatAccount extends StatelessWidget {
  final bool showTrailing;

  const AnyChatAccount({Key? key, this.showTrailing = true}) : super(key: key);

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
            label: 'Delete',
          ),
        ],
      ),
      child: ListTile(
        onTap: () {
          navigateToPage(context, Chat());
        },
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 10.0,
        ),
        leading: SvgPicture.asset(Images.chatAccountDefault),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: highlightOccurrences('Hossein Asadi', ''),
                style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1!.color,
                ),
              ),
            ),
            const SizedBox(height: 4.0),
            Text(
              'sffsdfsfwefewfewfefwefewfewjfhwefjrnjkrngnbrejhgjerbgbhrejbghjbrgh',
              overflow: TextOverflow.ellipsis,
              style:
                  TextStyle(color: Colors.grey, fontSize: AppTheme.sFontSize),
            ),
          ],
        ),
        trailing: Visibility(
          visible: showTrailing,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '12:21 AM',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: AppTheme.sFontSize,
                ),
              ),
              const SizedBox(height: 6.0),
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
