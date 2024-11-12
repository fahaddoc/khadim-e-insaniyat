import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_buttons/app_button.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppNavigationBar extends StatelessWidget {
  const AppNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      height: 100,
      decoration: BoxDecoration(
        color: AppTheme.colors(context).primary,
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: AppTheme.colors(context).textTersiary,
          ),
        ),
      ),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  child: Assets.images.khadimLogo.image(width: 100, height: 100),
                ),
                Text(
                  'Khadim-E-Insaniyat',
                  style: AppTextStyles.h20(AppTheme.colors(context).surface),
                ),
              ],
            ),
            Row(
              children: [AppButton.ghostNeutral(size: AppButtonSize.medium)],
            )
          ],
        ),
      ),
    );
  }
}
