import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  static AppColors colors(BuildContext context) =>
      Theme.of(context).extension<AppColors>() ?? lightThemeColors;

  static AppColors get lightThemeColors => AppColors(
    success: AppColors.emerald600,
    critical: AppColors.red600,
    criticalActive: AppColors.red800,
    criticalHighlight: AppColors.red50,
    criticalHighlightActive: AppColors.red200,
    criticalHighlightHover: AppColors.red100,
    criticalHover: AppColors.red700,
    mistakeCritical: const Color(0xFFC4554D),
    disabled: AppColors.grey100,
    ghost: AppColors.greyTransparent,
    highlightActive: AppColors.grey200,
    highlightHover: AppColors.grey100,
    input: AppColors.grey0,
    neutralHighlight: AppColors.grey50,
    neutralHighlightActive: AppColors.grey200,
    neutralHighlightHover: AppColors.grey100,
    primary: AppColors.khadimPrim,
    primaryActive: AppColors.green900,
    primaryHighlight: AppColors.green50,
    primaryHighlightActive: AppColors.blue200,
    primaryHighlightHover: AppColors.blue100,
    primaryHover: AppColors.blue800,
    secondary: AppColors.khadimSec,
    tertiary: AppColors.grey400,
    border: AppColors.grey200,
    borderSecondary: AppColors.grey500,
    borderCritical: AppColors.red700,
    borderDisabled: AppColors.grey200,
    borderInfo: AppColors.blue700,
    borderPrimary: AppColors.green700,
    borderPrimaryActive: AppColors.green900,
    borderPrimaryHover: AppColors.green800,
    borderWarning: AppColors.yellow700,
    borderSuccess: AppColors.emerald700,
    text: AppColors.grey900,
    textCritical: AppColors.red800,
    textDisabled: AppColors.grey400,
    textInfo: AppColors.blue800,
    textInverse: AppColors.grey0,
    textPrimary: AppColors.green700,
    textLink: AppColors.blue600,
    textPrimaryActive: AppColors.green900,
    textPrimaryHover: AppColors.green800,
    textTersiary: AppColors.grey500,
    textNavigation: AppColors.grey600,
    textWarning: AppColors.yellow800,
    textSuccess: AppColors.emerald800,
    successHighlight: AppColors.emerald50,
    toast: AppColors.grey950,
    surface: AppColors.grey0,
    surfaceDark: AppColors.grey950,
    surfaceOverlay: AppColors.grey0,
    workplaceType: const Color(0xFFFADCDB),
    jobType: const Color(0xFFE3F3E4),
    experienceLevel: const Color(0xFFF0DEF2),
    compensation: const Color(0xFFFFEFD6),
    education: const Color(0xFFD6F5FF),
    skeletonView: const Color(0xFFF7FAF9),
    bannerWarning: const Color(0xFFFFE8B8),
    aiCritical: AppColors.red100,
    borderAiCritical: AppColors.red600,
    aiGrammar: AppColors.blue100,
    borderAiGrammar: AppColors.blue700,
    aiPurple: const Color(0xFF870CE8),
    textDanger: const Color(0xFFE11D48),
  );

  static ThemeData get light => ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      lightThemeColors,
    ],
    scaffoldBackgroundColor: AppColors.grey0,
  );

  static Color? statusBarColor;

  static void brightenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
      statusBarColor: statusBarColor,
    ),
  );

  static void darkenStatusBar() => SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      statusBarColor: statusBarColor,
    ),
  );

  static void setStatusBarColor(Color color) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color,
      ),
    );
    statusBarColor = color;
  }
}
