import 'package:flutter/material.dart';

void showGeneralBottomSheet(
  BuildContext context, {
  String? title,
  bool dismissible = true,
  Widget? child,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (_) {
      return SingleChildScrollView(
        child: WillPopScope(
          onWillPop: () async {
            return dismissible;
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 10.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(title ?? ''),
                    ),
                    if (dismissible)
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                  ],
                ),
              ),
              if (child != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: child,
                ),
              const SizedBox(height: 20.0),
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
