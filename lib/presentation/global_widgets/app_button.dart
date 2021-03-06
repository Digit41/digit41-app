import 'dart:async';

import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String title;
  final Color? color;
  final GestureTapCallback onTap;
  final Widget? icon;
  final bool zeroMargin;
  final bool spaceBetween;
  final double? titleSize;

  const AppButton({
    Key? key,
    required this.title,
    required this.onTap,
    this.color,
    this.icon,
    this.titleSize,
    this.zeroMargin = false,
    this.spaceBetween = true,
  }) : super(key: key);

  @override
  _AppButtonState createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with TickerProviderStateMixin {
  late AnimationController _controller;

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    Timer(const Duration(milliseconds: 200), () {
      _controller.reverse();
      widget.onTap();
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _tapDown,
      onTapUp: _tapUp,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: 1 - _controller.value,
            child: Container(
              padding: widget.zeroMargin
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 13.0,
                    ),
              margin: widget.zeroMargin
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(bottom: 16.0),
              decoration: BoxDecoration(
                color: widget.color ?? Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              ),
              child: Row(
                mainAxisAlignment: widget.spaceBetween
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                children: [
                  if (widget.icon != null)
                    SizedBox(width: 24.0, height: 24.0, child: widget.icon),
                  if (widget.icon != null) const SizedBox(width: 4.0),
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: widget.titleSize,
                      fontWeight: FontWeight.bold,
                      height: 1.0,
                    ),
                  ),
                  // if (widget.ic) Container()
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
