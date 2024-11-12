import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class CheckBoxField extends StatelessWidget {
  final String title;
  final String description;
  final bool value;
  final VoidCallback? onTap;
  final double horizontalMargin;

  const CheckBoxField({
    super.key,
    required this.title,
    required this.description,
    required this.value,
    this.onTap,
    this.horizontalMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: horizontalMargin),
        decoration: BoxDecoration(
          color: AppTheme.colors(context).neutralHighlight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.t14(AppTheme.colors(context).text),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: AppTextStyles.c12(AppTheme.colors(context).text),
                    ),
                  ],
                ),
              ),
            ),
            Checkbox(
              value: value,
              onChanged: (value) {
                if (onTap != null) onTap!();
              },
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
