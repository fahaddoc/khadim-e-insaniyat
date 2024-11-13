import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_buttons/app_button.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class CurrentOPD extends StatelessWidget {
  final String title;
  final String tokenNumber;

  const CurrentOPD({
    super.key,
    required this.title,
    required this.tokenNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.h32(
                      AppTheme.colors(context).text,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'TOKEN # $tokenNumber',
                    style: AppTextStyles.h24(
                      AppTheme.colors(context).text,
                    ),
                  )
                ],
              ),
            ),
            AppButton.primary(
              size: AppButtonSize.medium,
              label: 'Save & Print',
            ),
          ],
        ),
      ),
    );
  }
}
