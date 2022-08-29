import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';

class Attach extends StatelessWidget {
  const Attach({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _anyItem(context, Images.gallery, Strings.gallery),
        const SizedBox(width: 40.0),
        _anyItem(context, Images.camera, Strings.camera),
      ],
    );
  }

  Widget _anyItem(BuildContext ctx, String image, String title) =>
      GestureDetector(
        onTap: () {
          // navigateToPage(ctx, const AppGallery());
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppTheme.grey,
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 40.0),
          child: Column(
            children: [
              SvgPicture.asset(image),
              const SizedBox(height: 8.0),
              Text(title)
            ],
          ),
        ),
      );
}
