import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';
import 'bubble_chat_menu.dart';

class BubbleChat extends StatelessWidget {
  final String msg;
  final int msgIndex;

  final bool showRibbons;
  final Widget? child;
  final bool sent;
  final ReplyMessage? replyMessage;

  const BubbleChat({
    Key? key,
    required this.msgIndex,
    this.msg = 'this is a msg for test',
    this.sent = true,
    this.showRibbons = false,
    this.child,
    this.replyMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BubbleChatMenu(
      username: 'now is fake',
      msg: msg,
      sent: sent,
      msgIndex: msgIndex,
      child: Column(
        children: [
          Align(
            alignment: sent ? Alignment.centerRight : Alignment.centerLeft,
            child: Stack(
              children: [
                Container(
                  width: showRibbons ? 218.0 : null,
                  decoration: BoxDecoration(
                    color: showRibbons
                        ? Colors.white
                        : sent
                            ? AppTheme.primaryColor
                            : AppTheme.grey,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(8.0),
                      topLeft: const Radius.circular(8.0),
                      bottomLeft: sent
                          ? const Radius.circular(8.0)
                          : const Radius.circular(0.0),
                      bottomRight: sent
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
                        if (replyMessage != null)
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5.0),
                            child: replyMessage!,
                          ),
                        child != null
                            ? child!
                            : Text(
                                msg,
                                style: TextStyle(
                                  color: sent ? Colors.black : Colors.white,
                                  height: 1.5,
                                ),
                              ),
                        const SizedBox(height: 5.0),
                        Container(
                          margin:
                              EdgeInsets.only(top: showRibbons ? 20.0 : 0.0),
                          alignment: Alignment.bottomRight,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                //todo: must be change
                                '${DateTime.now().hour}:${DateTime.now().minute}',
                                style: TextStyle(
                                  color: sent ? Colors.black : Colors.grey,
                                  fontSize: AppTheme.ssFontSize,
                                ),
                              ),
                              if (sent) const SizedBox(width: 6.0),
                              if (sent) SvgPicture.asset(Images.chatMsgSeen),
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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}

class ReplyMessage extends StatelessWidget {
  final String username;
  final String message;
  final bool _sent;

  const ReplyMessage(this._sent,
      {Key? key, required this.username, required this.message})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 2.0,
          height: 33.0,
          color: _sent ? Colors.black : AppTheme.primaryColor,
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: TextStyle(
                    color: _sent ? Colors.black : AppTheme.primaryColor,
                    fontSize: AppTheme.mFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  message,
                  style: TextStyle(
                    color: _sent ? AppTheme.grey : Colors.grey,
                    fontSize: AppTheme.sFontSize,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
