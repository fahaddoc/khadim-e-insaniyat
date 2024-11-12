import 'dart:io';

import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_colors.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ProfileImageButton extends StatelessWidget {
  final File? localImageFile;
  final double horizontalMargin;
  final VoidCallback? onTap;

  const ProfileImageButton({
    super.key,
    this.localImageFile,
    this.horizontalMargin = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: onTap,
      cursor: SystemMouseCursors.click,
      builder: (_,hover) => Container(
        height: 80,
        width: 80,
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: AppTheme.colors(context).neutralHighlight,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              color: AppColors.black.withOpacity(0.12),
            ),
          ],
        ),
        child: localImageFile == null
            ? Assets.icons.uploadImage.image(
                width: 32,
                height: 32,
              )
            : SizedBox.expand(
                child: kIsWeb
                    ? Image.network(
                        localImageFile!.path,
                        fit: BoxFit.cover,
                      )
                    : Image.file(
                        localImageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
      ),
    );
  }
}
