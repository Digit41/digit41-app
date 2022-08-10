import 'package:flutter/material.dart';

SnackBar showSnack({Widget? icon, required String txt}) => SnackBar(
      duration: const Duration(seconds: 1),
      content: Container(
        height: 30.0,
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) icon,
            if (icon != null) const SizedBox(width: 4.0),
            Text(txt),
          ],
        ),
      ),
    );
