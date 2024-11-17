import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';


class AppDropdownButton<T> extends StatelessWidget {
  final Widget child;
  final List<T> items;
  final List<T> secondaryItems;
  final Widget Function(T) itemBuilder;
  final void Function(T) onItemSelect;
  final PopupMenuPosition position;
  final Offset? offset;
  final double? maxHeight;
  final double? minWidth;
  final double? maxWidth;
  final bool isDisabled;
  final String tooltipText;
  final Color? color;
  final Color? hoverColor;

  const AppDropdownButton({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.onItemSelect,
    required this.child,
    this.secondaryItems = const [],
    this.position = PopupMenuPosition.over,
    this.offset,
    this.maxHeight,
    this.minWidth,
    this.maxWidth,
    this.isDisabled = false,
    this.tooltipText = "",
    this.color,
    this.hoverColor,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
      ),
      child: PopupMenuButton(
        surfaceTintColor: color ?? Colors.white,
        padding: EdgeInsets.zero,
        popUpAnimationStyle: AnimationStyle.noAnimation,
        color: color ?? Colors.white,
        enabled: !isDisabled,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        constraints: BoxConstraints(
          minWidth: minWidth ?? 2.0 * 56.0,
          maxWidth: maxWidth ?? double.infinity,
          maxHeight: maxHeight ?? double.infinity,
        ),
        position: position,
        offset: offset ?? const Offset(0, 35),
        tooltip: tooltipText,
        splashRadius: 10,
        itemBuilder: (context) => [
          ...secondaryItems.map(
            (e) => PopupMenuItem(
              padding: EdgeInsets.zero,
              value: e,
              onTap: () => onItemSelect(e),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Colors.white.withOpacity(0),
                ),
                child: AppGestureDetector(
                  builder: (context, onHover) => AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: onHover
                          ? hoverColor ?? AppTheme.colors(context).neutralHighlight
                          : color ?? Colors.white.withOpacity(0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: itemBuilder(e),
                  ),
                ),
              ),
            ),
          ),
          ...items.map(
            (e) => PopupMenuItem(
              height: 40,
              padding: EdgeInsets.zero,
              value: e,
              onTap: () => onItemSelect(e),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: color ?? Colors.white.withOpacity(0),
                ),
                child: AppGestureDetector(
                  builder: (context, onHover) => AnimatedContainer(
                    height: 40,
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: onHover
                          ? hoverColor ?? AppTheme.colors(context).neutralHighlight
                          : color ?? Colors.white.withOpacity(0),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: itemBuilder(e),
                  ),
                ),
              ),
            ),
          ),
        ],
        child: child,
      ),
    );
  }
}
