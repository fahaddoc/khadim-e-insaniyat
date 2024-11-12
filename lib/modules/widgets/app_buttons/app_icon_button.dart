import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppIconButton extends StatelessWidget {
  final double size;
  final Color? color;
  final AssetGenImage? icon;
  final double iconWidth;
  final double iconHeight;
  final Color? iconColor;
  final double borderWidth;
  final Color? borderColor;
  final Color? hoverColor;
  final VoidCallback? onTap;

  const AppIconButton({
    super.key,
    this.size = 40,
    this.color,
    this.icon,
    this.iconWidth = 18,
    this.iconHeight = 18,
    this.iconColor,
    this.borderWidth = 0.5,
    this.borderColor,
    this.hoverColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      builder: (context, isHovered) => AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isHovered
              ? (hoverColor ?? AppTheme.colors(context).neutralHighlightHover)
              : (color ?? AppTheme.colors(context).surface),
          shape: BoxShape.circle,
          border: Border.all(
            width: borderWidth,
            color: borderColor ?? AppTheme.colors(context).border,
          ),
        ),
        child: (icon ?? Assets.icons.edit).image(
          width: iconWidth,
          height: iconHeight,
          color: iconColor ?? AppTheme.colors(context).text,
        ),
      ),
    );
  }
}
