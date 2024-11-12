import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class PlainHeaderTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? hint;
  final double horizontalMargin;
  final Function(String)? onChanged;

  const PlainHeaderTextField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.hint,
    this.horizontalMargin = 16,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      maxLines: null,
      textCapitalization: TextCapitalization.sentences,
      cursorColor: AppTheme.colors(context).text,
      style: AppTextStyles.t18(
        AppTheme.colors(context).text,
      ),
      onChanged: onChanged,
      decoration: InputDecoration(
        isCollapsed: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: true,
        contentPadding: EdgeInsets.symmetric(
            vertical: 2, horizontal: horizontalMargin),
        border: InputBorder.none,
        hintText: hint,
        hintStyle: AppTextStyles.t18(
          AppTheme.colors(context).textTersiary,
        ),
      ),
    );
  }
}
