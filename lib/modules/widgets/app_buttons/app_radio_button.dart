import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';

class AppRadioButton extends StatelessWidget {
  final double size;
  final bool isSelected;
  final VoidCallback? onTap;

  const AppRadioButton({
    super.key,
    this.size = 20,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      builder: (_, isHover) => AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
          border: _border(context),
        ),
      ),
    );
  }

  BoxBorder _border(BuildContext context) {
    switch (isSelected) {
      case true:
        return Border.all(
          width: (size / 3).truncate().toDouble(),
          color: AppTheme.colors(context).primaryActive,
        );
      case false:
        return Border.all(
          width: 1,
          color: AppTheme.colors(context).border,
        );
    }
  }
}
