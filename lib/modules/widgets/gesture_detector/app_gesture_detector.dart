import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';

class AppGestureDetector extends StatefulWidget {
  final Widget Function(BuildContext context, bool isHovered) builder;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onLongPress;
  final Function(PointerEvent event)? onEnter;
  final Function(PointerEvent event)? onExit;
  final MouseCursor cursor;
  final bool preventHover;

  const AppGestureDetector({
    super.key,
    required this.builder,
    this.onTap,
    this.onLongPress,
    this.cursor = SystemMouseCursors.click,
    this.onEnter,
    this.onExit,
    this.preventHover = false,
  });

  @override
  State<AppGestureDetector> createState() => _AppGestureDetectorState();
}

class _AppGestureDetectorState extends State<AppGestureDetector> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onDoubleTap: widget.onLongPress,
      onTap: widget.onTap,
      child: MouseRegion(
        cursor: widget.cursor,
        onEnter: onMouseEnter,
        onExit: onMouseExit,
        child: widget.builder(context, isHovered),
      ),
    );
  }

  void onMouseEnter(PointerEnterEvent event) async {
    if (widget.preventHover) {
      return;
    }
    if (!mounted) {
      return;
    }
    if (isHovered) {
      return;
    }
    if (widget.onEnter != null) {
      widget.onEnter!(event);
    }
    setState(() {
      isHovered = true;
    });
  }

  void onMouseExit(PointerExitEvent event) async {
    if (widget.preventHover) {
      return;
    }
    if (!mounted) {
      return;
    }
    if (!isHovered) {
      return;
    }
    if (widget.onExit != null) {
      widget.onExit!(event);
    }
    setState(() {
      isHovered = false;
    });
  }
}
