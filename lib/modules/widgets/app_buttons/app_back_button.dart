import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';


class AppBackButton extends StatelessWidget {
  final Color? color;
  final VoidCallback? onTap;

  const AppBackButton({
    super.key,
    this.color,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 24,
        width: 24,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Assets.icons.longArrowLeft.image(
          width: 24,
          height: 24,
          color: color ?? AppTheme.colors(context).text,
        ),
      ),
    );
  }
}
