import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';

class BubbleChat extends StatelessWidget {
  final bool showRibbons;
  final Widget? child;
  final bool send;

  const BubbleChat(
      {Key? key, this.send = true, this.showRibbons = false, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: send ? Alignment.centerRight : Alignment.centerLeft,
          child: Stack(
            children: [
              Container(
                width: showRibbons ? 218.0 : null,
                decoration: BoxDecoration(
                  color: showRibbons
                      ? Colors.white
                      : send
                          ? Theme.of(context).primaryColor
                          : AppTheme.grey,
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(8.0),
                    topLeft: const Radius.circular(8.0),
                    bottomLeft: send
                        ? const Radius.circular(8.0)
                        : const Radius.circular(0.0),
                    bottomRight: send
                        ? const Radius.circular(0.0)
                        : const Radius.circular(8.0),
                  ),
                ),
                padding: const EdgeInsets.only(
                  left: 8.0,
                  right: 8.0,
                  bottom: 8.0,
                  top: 4.0,
                ),
                child: IntrinsicWidth(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      child != null
                          ? child!
                          : Text(
                              'erfreewdee',
                              style: TextStyle(
                                color: send ? Colors.black : Colors.white,
                                height: 1.5,
                              ),
                            ),
                      Container(
                        margin: EdgeInsets.only(top: showRibbons ? 20.0 : 6.0),
                        alignment: Alignment.bottomRight,
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
                            if (send) SvgPicture.asset(Images.chatMsgSeen),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (showRibbons) SvgPicture.asset(Images.ribbons),
            ],
          ),
        ),
        const SizedBox(height: 12.0),
      ],
    );
  }
}
