import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../post/widgets/any_post.dart';

class MyItems extends StatelessWidget {
  const MyItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: 10,
      itemBuilder: (_, index) => Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  'https://s6.uupload.ir/files/image_klio.png',
                  width: 100.0,
                  height: 80.0,
                ),
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('sfddsgf'),
                    const SizedBox(height: 14.0),
                    Text(
                      'fdgfdgfgdf',
                      style: TextStyle(
                        fontSize: AppTheme.sFontSize,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 14.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: const [
                            AnyOptionOfPost(Images.like, '10'),
                            SizedBox(width: 20.0),
                            AnyOptionOfPost(Images.comment, '2'),
                            SizedBox(width: 20.0),
                            AnyOptionOfPost(Images.heartDigit, '5'),
                          ],
                        ),
                        SvgPicture.asset(Images.box)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
