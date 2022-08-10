import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';

class BubbleChat extends StatelessWidget {
  final bool send;

  const BubbleChat({Key? key, this.send = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: send ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          color: send ? Theme.of(context).primaryColor : AppTheme.grey,
          borderRadius: BorderRadius.only(
            topRight: const Radius.circular(8.0),
            topLeft: const Radius.circular(8.0),
            bottomLeft:
                send ? const Radius.circular(8.0) : const Radius.circular(0.0),
            bottomRight:
                send ? const Radius.circular(0.0) : const Radius.circular(8.0),
          ),
        ),
        padding: const EdgeInsets.all(8.0),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'erfreewdee',
                style: TextStyle(
                  color: send ? Colors.black : Colors.white,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 6.0),
              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '7:00 PM',
                      style: TextStyle(
                        color: send ? Colors.black : Colors.grey,
                        fontSize: AppTheme.ssFontSize,
                      ),
                    ),
                    if (send) const SizedBox(width: 6.0),
                    if (send) SvgPicture.asset(Images.chatSeen),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
