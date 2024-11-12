import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class GreyBottomSheetCloseButton extends StatelessWidget {
  final double horizontalMargin;
  final VoidCallback? onTap;

  const GreyBottomSheetCloseButton({
    super.key,
    this.horizontalMargin = 12,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: const Color(0xFF6B6B6B).withOpacity(0.5),
          shape: BoxShape.circle,
        ),
        child: Assets.icons.cross.image(
          width: 24,
          height: 24,
          color: AppTheme.colors(context).input,
        ),
      ),
    );
  }
}
