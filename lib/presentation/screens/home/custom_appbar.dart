import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utils/images_path.dart';
import '../../../utils/strings.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130.0,
      backgroundColor: Colors.transparent,
      pinned: true,
      titleSpacing: 0.0,
      title: _InvisibleExpandedHeader(
        child: Container(
          height: 65.0,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 10.0),
          decoration: BoxDecoration(
            gradient: RadialGradient(
              radius: 9.0,
              colors: [
                Colors.grey.shade900,
                Colors.black,
                Colors.black,
                Colors.black,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                Strings.tBalance,
                style: TextStyle(color: Colors.grey, fontSize: 11.0),
              ),
              Text(
                // todo: this will change
                '232,22 DGT',
                style: TextStyle(color: Colors.white, fontSize: 11.0),
              ),
              Text(''.padRight(Strings.tBalance.length)),
            ],
          ),
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Column(
          children: [
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  Strings.totalBalance,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                  ),
                ),
                SvgPicture.asset(Images.bellNotif),
              ],
            ),
            const SizedBox(height: 2.0),
            Row(
              children: [
                SvgPicture.asset(
                  Images.splashLogo,
                  width: 20.0,
                  height: 20.0,
                ),
                const SizedBox(width: 8.0),
                Text('2,344 DGT', style: const TextStyle(fontSize: 18.0)),
                const SizedBox(width: 8.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.green.withAlpha(90),
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6.0,
                    vertical: 3.0,
                  ),
                  child: Text(
                    // todo: this will change
                    '+3.5',
                    style: const TextStyle(fontSize: 10.0, color: Colors.green),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                // todo: this will change
                'ETH 1500',
                style: const TextStyle(fontSize: 12.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvisibleExpandedHeader extends StatefulWidget {
  final Widget child;

  const _InvisibleExpandedHeader({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<_InvisibleExpandedHeader> createState() {
    return _InvisibleExpandedHeaderState();
  }
}

class _InvisibleExpandedHeaderState extends State<_InvisibleExpandedHeader> {
  ScrollPosition? _position;
  bool? _visible;

  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)?.position;
    _position?.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position?.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
    bool visible =
        settings == null || settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible ?? false,
      child: widget.child,
    );
  }
}
