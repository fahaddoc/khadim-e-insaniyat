import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppCrossButton extends StatelessWidget {
  final double? boxSize;
  final double iconSize;
  final Color? color;
  final VoidCallback? onTap;

  const AppCrossButton({
    super.key,
    this.boxSize,
    this.iconSize = 28,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: boxSize ?? iconSize,
        width: boxSize ?? iconSize,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Assets.icons.cross.image(
          height: iconSize,
          width: iconSize,
          color: color ?? AppTheme.colors(context).text,
        ),
      ),
    );
  }
}
