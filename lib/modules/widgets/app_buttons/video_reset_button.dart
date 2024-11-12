import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class VideoResetButton extends StatelessWidget {
  final VoidCallback? onTap;

  const VideoResetButton({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 68,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppTheme.colors(context).surfaceDark.withOpacity(0.4),
          borderRadius: BorderRadius.circular(100),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: const Offset(0, 4),
              blurRadius: 8,
              color: AppTheme.colors(context).surfaceDark.withOpacity(0.25),
            ),
          ],
        ),
        child: Assets.icons.arrowRotateRight.image(
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
