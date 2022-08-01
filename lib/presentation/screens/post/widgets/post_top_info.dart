import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/images_path.dart';

class PostTopInfo extends StatelessWidget {
  const PostTopInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: SvgPicture.asset(
            Images.splashLogo,
            width: 28.0,
            height: 28.0,
          ),
        ),
        const SizedBox(width: 6.0),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              // todo: this will change
              'Abo ghanbari',
              style: const TextStyle(fontSize: 12.0),
            ),
            const SizedBox(height: 2.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 1.0,
                    horizontal: 4.0,
                  ),
                  child: Text(
                    'ENS',
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 10.0,
                    ),
                  ),
                ),
                const SizedBox(width: 4.0),
                Text(
                  // todo: this will change
                  'sofdo.com',
                  style: const TextStyle(fontSize: 10.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
