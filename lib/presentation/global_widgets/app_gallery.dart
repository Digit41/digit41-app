// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:photo_gallery/photo_gallery.dart';
//
// import '../../utils/strings.dart';
// import '../snack_bars/bottom_snack.dart';
//
// class AppGallery extends StatefulWidget {
//   const AppGallery({Key? key}) : super(key: key);
//
//   @override
//   State<AppGallery> createState() => _AppGalleryState();
// }
//
// class _AppGalleryState extends State<AppGallery> {
//   List<lip.LocalImage>? images;
//
//   void _init() async {
//     final List<Album> imageAlbums = await PhotoGallery.listAlbums(
//       mediumType: mediumType.image,
//     );
//   }
//
//   Future<bool> _promptPermissionSetting() async {
//     if (Platform.isIOS &&
//         await Permission.storage.request().isGranted &&
//         await Permission.photos.request().isGranted ||
//         Platform.isAndroid && await Permission.storage.request().isGranted) {
//       return true;
//     }
//     return false;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _init();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text(Strings.gallery), centerTitle: true),
//       body: images == null
//           ? InkWell(
//               onTap: _init,
//               child: Text('try again'),
//             )
//           : ListView.builder(
//               shrinkWrap: true,
//               itemCount: images!.length,
//               itemBuilder: (_, int index) => Image(
//                 image: lip.DeviceImage(images![index]),
//               ),
//             ),
//     );
//   }
// }
