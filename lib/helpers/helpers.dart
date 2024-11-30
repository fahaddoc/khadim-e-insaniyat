import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:toastification/toastification.dart';

String formatCurrency(String value) {
  value = value.split(',').join('');
  String newText = value.toString();
  int remainder = newText.length % 3;
  String initialText = remainder == 0
      ? newText.substring(0, 3)
      : newText.substring(0, remainder);
  String leftOverText =
      remainder == 0 ? newText.substring(3) : newText.substring(remainder);
  int index = 0;
  for (String i in leftOverText.split('')) {
    index++;
    if (index % 3 == 1) {
      initialText += ',';
    }
    initialText += i;
  }
  return initialText;
}

dynamic appToast(
  BuildContext context,
  String heading,
  String message, {
  ToastificationType? type = ToastificationType.error,
}) {
  return toastification.show(
    showIcon: false,
    type: type,
    style: ToastificationStyle.fillColored,
    context: context,
    title: Text(heading,
        style: AppTextStyles.b14(AppTheme.colors(context).surface)),
    description: Column(
      children: [
        Text(
          message,
          style: AppTextStyles.c12(AppTheme.colors(context).surface),
        ),
      ],
    ),
    autoCloseDuration: const Duration(seconds: 5),
  );
}
