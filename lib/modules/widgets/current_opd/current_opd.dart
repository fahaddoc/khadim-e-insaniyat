import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class CurrentOPD extends StatelessWidget {
  final String? title;
  final String tokenNumber;

  const CurrentOPD({
    super.key,
    this.title,
    required this.tokenNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
      decoration: BoxDecoration(
        color: AppTheme.colors(context).surface,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: AppTextStyles.h20(
                    AppTheme.colors(context).text,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'TOKEN # $tokenNumber',
                  style: AppTextStyles.t18(
                    AppTheme.colors(context).textTersiary,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
