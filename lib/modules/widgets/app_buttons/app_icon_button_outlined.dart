import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppIconButtonOutlined extends StatelessWidget {
  final AssetGenImage icon;
  final Color? iconColor;
  final VoidCallback? onTap;
  final double size;
  final double iconWidth;
  final double iconHeight;
  final BoxDecoration? decoration;
  final bool? isDisable;

  const AppIconButtonOutlined({
    super.key,
    required this.icon,
    this.iconColor,
    this.onTap,
    this.size = 40,
    this.iconWidth = 18,
    this.iconHeight = 18,
    this.decoration,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: ()=> !isDisable! ? onTap!() : null,
      builder: (context, isHovered) => Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: decoration ??
            BoxDecoration(
              color: isHovered ? AppTheme.colors(context).neutralHighlight :
                  !isDisable! ?
              AppTheme.colors(context).surface : AppTheme.colors(context).neutralHighlightHover,
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: AppTheme.colors(context).border,
              ),
            ),
        child: icon.image(
          width: iconWidth,
          height: iconHeight,
          color: iconColor ?? AppTheme.colors(context).text,
        ),
      ),
    );
  }
}
