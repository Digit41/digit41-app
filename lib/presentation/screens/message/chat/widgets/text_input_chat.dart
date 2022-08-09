import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../utils/app_theme.dart';
import '../../../../../utils/images_path.dart';
import '../../../../../utils/strings.dart';

class TextInputChat extends StatefulWidget {
  const TextInputChat({Key? key}) : super(key: key);

  @override
  State<TextInputChat> createState() => _TextInputChatState();
}

class _TextInputChatState extends State<TextInputChat> {
  final TextEditingController _textController = TextEditingController();
  bool _isWriting = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              maxLines: null,
              textInputAction: TextInputAction.send,
              onChanged: (String txt) {
                setState(() {
                  _isWriting = txt.isNotEmpty;
                });
              },
              onSubmitted: _submitMsg,
              textAlign: TextAlign.left,
              style: const TextStyle(height: 1.3),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide(
                    width: 0.0,
                    style: BorderStyle.none,
                  ),
                ),
                hintText: Strings.typeMsg,
                filled: true,
                fillColor: AppTheme.grey,
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: AppTheme.sFontSize,
                ),
                prefixIcon: IconButton(
                  icon: const Icon(
                    Icons.emoji_emotions_outlined,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: _isWriting
                ? _option(
                    Images.sendMsgTxt,
                    color: Theme.of(context).primaryColor,
                  )
                : Row(
                    children: [
                      _option(Images.sChat),
                      const SizedBox(width: 8.0),
                      _option(Images.attachment),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  void _submitMsg(String txt) {
    _textController.clear();
    setState(() {
      _isWriting = false;
    });
  }

  Widget _option(String icon,
          {GestureTapCallback? onTap, Color color = AppTheme.grey}) =>
      GestureDetector(
        onTap: onTap,
        child: Container(
          width: 46.0,
          height: 46.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: color,
          ),
          alignment: Alignment.center,
          child: SvgPicture.asset(icon),
        ),
      );
}
