import 'package:blur/blur.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/app_theme.dart';
import '../../../../utils/images_path.dart';
import '../../../../utils/strings.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 130.0,
      backgroundColor: Colors.transparent,
      pinned: true,
      title: _InvisibleExpandedHeader(
        child: Stack(
          children: [
            Blur(
              blurColor: Colors.black,
              colorOpacity: 0.8,
              blur: 10.0,
              child: Container(height: 100.0),
            ),
            SizedBox(
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.tBalance,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppTheme.sFontSize,
                    ),
                  ),
                  Text(
                    // todo: this will change
                    '232,22 DGT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: AppTheme.mFontSize,
                    ),
                  ),
                  Text(''.padRight(Strings.tBalance.length)),
                ],
              ),
            ),
          ],
        ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Strings.totalBalance,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: AppTheme.ssFontSize,
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
                  Text(
                    '2,344 DGT',
                    style: TextStyle(fontSize: AppTheme.lFontSize),
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryColor.withAlpha(90),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6.0,
                      vertical: 3.0,
                    ),
                    child: Text(
                      // todo: this will change
                      '+3.5',
                      style: TextStyle(
                        fontSize: AppTheme.ssFontSize,
                        color: AppTheme.primaryColor,
                      ),
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
                  style: TextStyle(fontSize: AppTheme.sFontSize),
                ),
              ),
            ],
          ),
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
