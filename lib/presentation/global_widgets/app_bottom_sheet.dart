import 'package:flutter/material.dart';

void showGeneralBottomSheet(
  BuildContext context, {
  String? title,
  bool dismissible = true,
  Widget? child,
}) {
  showModalBottomSheet(
    context: context,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async {
          return dismissible;
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, right: 16.0, left: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title ?? ''),
                  if (dismissible)
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                ],
              ),
              if (child != null) child,
            ],
          ),
        ),
      );
    },
    barrierColor: Colors.grey.withOpacity(0.9),
    isDismissible: dismissible,
    enableDrag: dismissible,
  );
}
