import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/chips/selection_tag.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppTagField extends StatelessWidget {
  final String? label;
  final String? hint;
  final List<SelectionTag> tags;
  final double? horizontalMargin;
  final VoidCallback? onTap;

  const AppTagField({
    super.key,
    this.label,
    this.hint,
    required this.tags,
    this.horizontalMargin,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: AppTextStyles.c12(
                AppTheme.colors(context).text,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
          ],
          GestureDetector(
            onTap: onTap,
            child: Container(
              constraints: const BoxConstraints(minHeight: 40),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal:
                    (tags.isEmpty ? 16 : 8) - 1,
                vertical: tags.isEmpty ? 0 : 8,
              ),
              decoration: BoxDecoration(
                color: AppTheme.colors(context).surface,
                border: Border.all(
                  width: 1,
                  color: AppTheme.colors(context).border,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: tags.isEmpty
                  ? Row(
                      children: [
                        Text(
                          hint ?? '',
                          style: AppTextStyles.b14(
                            AppTheme.colors(context).textTersiary,
                          ),
                        ),
                      ],
                    )
                  : Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
