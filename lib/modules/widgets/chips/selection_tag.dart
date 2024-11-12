import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class SelectionTag extends StatelessWidget {
  final String label;
  final bool isSelected;
  final bool showSelectedStyle;
  final bool showIcon;
  final VoidCallback? onTap;
  final VoidCallback? onCancel;
  final Color? borderColor;

  const SelectionTag(
      {super.key,
      required this.label,
      this.isSelected = false,
      this.onTap,
      this.onCancel,
      this.showSelectedStyle = true,
      this.showIcon = true,
      this.borderColor});

  bool get shouldShowSelectedStyle => isSelected && showSelectedStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelected && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.only(top: 8, bottom: 8, left: 16 - 1, right: 12 - 1),
        decoration: BoxDecoration(
          color: shouldShowSelectedStyle ? AppTheme.colors(context).primaryHighlightHover : Colors.transparent,
          borderRadius: BorderRadius.circular(100),
          border: Border.all(
            width: 1,
            color: shouldShowSelectedStyle
                ? AppTheme.colors(context).primaryHighlightHover
                : borderColor ?? AppTheme.colors(context).border,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: AppTextStyles.b14(
                shouldShowSelectedStyle ? AppTheme.colors(context).textPrimaryActive : AppTheme.colors(context).text,
              ),
            ),
            if (showIcon)
              if (isSelected) ...[
                const SizedBox(width: 4),
                AppGestureDetector(
                  onTap: onCancel,
                  cursor: SystemMouseCursors.click,
                  builder: (context, isHovered) => Assets.icons.cross.image(
                    height: 16,
                    width: 16,
                    color: AppTheme.colors(context).primaryActive,
                  ),
                ),
              ],
            if (showIcon)
              if (!isSelected) ...[
                const SizedBox(width: 4),
                AssetGenImage(Assets.icons.add.path).image(
                  height: 16,
                  width: 16,
                  color: AppTheme.colors(context).text,
                ),
              ],
          ],
        ),
      ),
    );
  }
}
