import 'package:flutter/material.dart';

void navigateToPage(
  BuildContext ctx,
  Widget page, {
  bool replace = false,
  bool replaceAll = false,
}) {
  if (replace) {
    Navigator.of(ctx).pushReplacement(
      MaterialPageRoute(builder: (ctx) => page),
    );
  } else if (replaceAll) {
    Navigator.of(ctx).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => page),
      (route) => false,
    );
  } else {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (ctx) => page));
  }
}
