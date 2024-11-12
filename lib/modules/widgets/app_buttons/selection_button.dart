import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_buttons/app_radio_button.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class SelectionButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onTap;

  const SelectionButton({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 42,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 16 - 1),
        decoration: BoxDecoration(
          color: _color(context),
          border: _border(context),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            AppRadioButton(isSelected: isSelected),
            const SizedBox(width: 8),
            Text(
              label,
              style: _textStyle(context),
            ),
          ],
        ),
      ),
    );
  }

  Color _color(BuildContext context) {
    switch (isSelected) {
      case true:
        return AppTheme.colors(context).primaryHighlight;
      case false:
        return AppTheme.colors(context).surfaceOverlay;
    }
  }

  BoxBorder _border(BuildContext context) {
    switch (isSelected) {
      case true:
        return Border.all(
          width: 1,
          color: AppTheme.colors(context).primaryActive,
        );
      case false:
        return Border.all(
          width: 1,
          color: AppTheme.colors(context).surfaceOverlay,
        );
    }
  }

  TextStyle _textStyle(BuildContext context) {
    switch (isSelected) {
      case true:
        return AppTextStyles.t14(AppTheme.colors(context).text);
      case false:
        return AppTextStyles.b14(AppTheme.colors(context).text);
    }
  }
}
