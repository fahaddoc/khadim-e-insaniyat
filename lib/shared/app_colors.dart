import 'package:flutter/material.dart';

class AppColors extends ThemeExtension<AppColors> {
  static Color get white => const Color(0xFFFFFFFF);

  static Color get black => const Color(0xFF000000);

  static Color get green0 => const Color(0xFFF1F5F1);

  static Color get blue50 => const Color(0xFFF0F9FF);

  static Color get blue100 => const Color(0xFFE0F2FE);

  static Color get blue200 => const Color(0xFFBAE6FD);

  static Color get blue300 => const Color(0xFF7DD3FC);

  static Color get blue400 => const Color(0xFF38BDF8);

  static Color get blue500 => const Color(0xFF0EA5E9);

  static Color get blue600 => const Color(0xFF0284C7);

  static Color get blue700 => const Color(0xFF0369A1);

  static Color get blue800 => const Color(0xFF075985);

  static Color get blue900 => const Color(0xFF0C4A6E);

  static Color get blue950 => const Color(0xFF082F49);

  static Color get emerald50 => const Color(0xFFECFDF5);

  static Color get emerald100 => const Color(0xFFD1FAE5);

  static Color get emerald200 => const Color(0xFFA7F3D0);

  static Color get emerald300 => const Color(0xFF6EE7B7);

  static Color get khadimSec => const Color(0xFF31E3C9);

  static Color get emerald400 => const Color(0xFF34D399);

  static Color get emerald500 => const Color(0xFF10B981);

  static Color get emerald600 => const Color(0xFF059669);

  static Color get emerald700 => const Color(0xFF047857);

  static Color get emerald800 => const Color(0xFF065F46);

  static Color get emerald900 => const Color(0xFF064E3B);

  static Color get emerald950 => const Color(0xFF022C22);

  static Color get green50 => const Color(0xFFF2FDF7);

  static Color get green100 => const Color(0xFFE5FAEE);

  static Color get green200 => const Color(0xFFCBF6DE);

  static Color get green300 => const Color(0xFFA0EEC3);

  static Color get green400 => const Color(0xFF74E7A7);

  static Color get green500 => const Color(0xFF49DF8B);

  static Color get green600 => const Color(0xFF25D070);

  static Color get green700 => const Color(0xFF00BA52);

  static Color get green800 => const Color(0xFF008F3F);

  static Color get green900 => const Color(0xFF005C28);

  static Color get green950 => const Color(0xFF003819);

  static Color get grey0 => const Color(0xFFFFFFFF);

  static Color get grey50 => const Color(0xFFF9FAFB);

  static Color get grey100 => const Color(0xFFF3F4F6);

  static Color get grey200 => const Color(0xFFE5E7EB);

  static Color get grey300 => const Color(0xFFD1D5DB);

  static Color get grey400 => const Color(0xFF9CA3AF);

  static Color get grey500 => const Color(0xFF6B7280);

  static Color get grey600 => const Color(0xFF4B5563);

  static Color get grey700 => const Color(0xFF374151);

  static Color get grey800 => const Color(0xFF1F2937);

  static Color get grey900 => const Color(0xFF111827);

  static Color get grey950 => const Color(0xFF030712);

  static Color get khadimPrim => const Color(0xFF3089FC);

  static Color get greyTransparent => const Color(0x00FFFFFF);

  static Color get red50 => const Color(0xFFFFF1F2);

  static Color get red100 => const Color(0xFFFFE4E6);

  static Color get red200 => const Color(0xFFFECDD3);

  static Color get red300 => const Color(0xFFFDA4AF);

  static Color get red400 => const Color(0xFFFB7185);

  static Color get red500 => const Color(0xFFF43F5E);

  static Color get red600 => const Color(0xFFE11D48);

  static Color get red700 => const Color(0xFFBE123C);

  static Color get red800 => const Color(0xFF9F1239);

  static Color get red900 => const Color(0xFF881337);

  static Color get red950 => const Color(0xFF4C0519);

  static Color get yellow50 => const Color(0xFFFEFCE8);

  static Color get yellow100 => const Color(0xFFFEF9C3);

  static Color get yellow200 => const Color(0xFFFEF08A);

  static Color get yellow300 => const Color(0xFFFDE047);

  static Color get yellow400 => const Color(0xFFFACC15);

  static Color get yellow500 => const Color(0xFFEAB308);

  static Color get yellow600 => const Color(0xFFCA8A04);

  static Color get yellow700 => const Color(0xFFB45309);

  static Color get yellow800 => const Color(0xFF92400E);

  static Color get yellow900 => const Color(0xFF78350F);

  static Color get yellow950 => const Color(0xFF451A03);

  final Color success;
  final Color critical;
  final Color criticalActive;
  final Color criticalHighlight;
  final Color criticalHighlightActive;
  final Color criticalHighlightHover;
  final Color criticalHover;
  final Color mistakeCritical;
  final Color disabled;
  final Color ghost;
  final Color highlightActive;
  final Color highlightHover;
  final Color input;
  final Color neutralHighlight;
  final Color neutralHighlightActive;
  final Color neutralHighlightHover;
  final Color primary;
  final Color primaryActive;
  final Color primaryHighlight;
  final Color primaryHighlightActive;
  final Color primaryHighlightHover;
  final Color primaryHover;
  final Color secondary;
  final Color tertiary;
  final Color border;
  final Color borderSecondary;
  final Color borderCritical;
  final Color borderDisabled;
  final Color borderInfo;
  final Color borderPrimary;
  final Color borderPrimaryActive;
  final Color borderPrimaryHover;
  final Color borderWarning;
  final Color borderSuccess;
  final Color text;
  final Color textDanger;
  final Color textCritical;
  final Color textDisabled;
  final Color textInfo;
  final Color textInverse;
  final Color textPrimary;
  final Color textLink;
  final Color textPrimaryActive;
  final Color textPrimaryHover;
  final Color textTersiary;
  final Color textNavigation;
  final Color textWarning;
  final Color textSuccess;
  final Color successHighlight;
  final Color toast;
  final Color surface;
  final Color surfaceDark;
  final Color surfaceOverlay;
  final Color workplaceType;
  final Color jobType;
  final Color experienceLevel;
  final Color compensation;
  final Color education;
  final Color skeletonView;
  final Color bannerWarning;
  final Color aiCritical;
  final Color borderAiCritical;
  final Color aiGrammar;
  final Color borderAiGrammar;
  final Color aiPurple;

  AppColors({
    required this.success,
    required this.critical,
    required this.criticalActive,
    required this.criticalHighlight,
    required this.criticalHighlightActive,
    required this.criticalHighlightHover,
    required this.criticalHover,
    required this.mistakeCritical,
    required this.disabled,
    required this.ghost,
    required this.highlightActive,
    required this.highlightHover,
    required this.input,
    required this.neutralHighlight,
    required this.neutralHighlightActive,
    required this.neutralHighlightHover,
    required this.primary,
    required this.primaryActive,
    required this.primaryHighlight,
    required this.primaryHighlightActive,
    required this.primaryHighlightHover,
    required this.primaryHover,
    required this.secondary,
    required this.tertiary,
    required this.border,
    required this.borderSecondary,
    required this.borderCritical,
    required this.borderDisabled,
    required this.borderInfo,
    required this.borderPrimary,
    required this.borderPrimaryActive,
    required this.borderPrimaryHover,
    required this.borderWarning,
    required this.borderSuccess,
    required this.text,
    required this.textCritical,
    required this.textDanger,
    required this.textDisabled,
    required this.textInfo,
    required this.textInverse,
    required this.textPrimary,
    required this.textLink,
    required this.textPrimaryActive,
    required this.textPrimaryHover,
    required this.textTersiary,
    required this.textNavigation,
    required this.textWarning,
    required this.textSuccess,
    required this.successHighlight,
    required this.toast,
    required this.surface,
    required this.surfaceDark,
    required this.surfaceOverlay,
    required this.workplaceType,
    required this.jobType,
    required this.experienceLevel,
    required this.compensation,
    required this.education,
    required this.skeletonView,
    required this.bannerWarning,
    required this.aiCritical,
    required this.borderAiCritical,
    required this.aiGrammar,
    required this.borderAiGrammar,
    required this.aiPurple,
  });

  @override
  ThemeExtension<AppColors> copyWith({
    Color? success,
    Color? critical,
    Color? criticalActive,
    Color? criticalHighlight,
    Color? criticalHighlightActive,
    Color? criticalHighlightHover,
    Color? criticalHover,
    Color? mistakeCritical,
    Color? disabled,
    Color? ghost,
    Color? highlightActive,
    Color? highlightHover,
    Color? input,
    Color? neutralHighlight,
    Color? neutralHighlightActive,
    Color? neutralHighlightHover,
    Color? primary,
    Color? primaryActive,
    Color? primaryHighlight,
    Color? primaryHighlightActive,
    Color? primaryHighlightHover,
    Color? primaryHover,
    Color? secondary,
    Color? tertiary,
    Color? border,
    Color? borderSecondary,
    Color? borderCritical,
    Color? borderDisabled,
    Color? borderInfo,
    Color? borderPrimary,
    Color? borderPrimaryActive,
    Color? borderPrimaryHover,
    Color? borderWarning,
    Color? borderSuccess,
    Color? text,
    Color? textCritical,
    Color? textDanger,
    Color? textDisabled,
    Color? textInfo,
    Color? textInverse,
    Color? textPrimary,
    Color? textLink,
    Color? textPrimaryActive,
    Color? textPrimaryHover,
    Color? textTersiary,
    Color? textNavigation,
    Color? textWarning,
    Color? textSuccess,
    Color? successHighlight,
    Color? toast,
    Color? surface,
    Color? surfaceDark,
    Color? surfaceOverlay,
    Color? workplaceType,
    Color? jobType,
    Color? experienceLevel,
    Color? compensation,
    Color? education,
    Color? skeletonView,
    Color? aiCritical,
    Color? borderAiCritical,
    Color? aiGrammar,
    Color? borderAiGrammar,
    Color? aiPurple,
  }) {
    return AppColors(
      success: success ?? this.success,
      critical: critical ?? this.critical,
      criticalActive: criticalActive ?? this.criticalActive,
      criticalHighlight: criticalHighlight ?? this.criticalHighlight,
      criticalHighlightActive:
          criticalHighlightActive ?? this.criticalHighlightActive,
      criticalHighlightHover:
          criticalHighlightHover ?? this.criticalHighlightHover,
      criticalHover: criticalHover ?? this.criticalHover,
      mistakeCritical: mistakeCritical ?? this.mistakeCritical,
      disabled: disabled ?? this.disabled,
      ghost: ghost ?? this.ghost,
      highlightActive: highlightActive ?? this.highlightActive,
      highlightHover: highlightHover ?? this.highlightHover,
      input: input ?? this.input,
      neutralHighlight: neutralHighlight ?? this.neutralHighlight,
      neutralHighlightActive:
          neutralHighlightActive ?? this.neutralHighlightActive,
      neutralHighlightHover:
          neutralHighlightHover ?? this.neutralHighlightHover,
      primary: primary ?? this.primary,
      primaryActive: primaryActive ?? this.primaryActive,
      primaryHighlight: primaryHighlight ?? this.primaryHighlight,
      primaryHighlightActive:
          primaryHighlightActive ?? this.primaryHighlightActive,
      primaryHighlightHover:
          primaryHighlightHover ?? this.primaryHighlightHover,
      primaryHover: primaryHover ?? this.primaryHover,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary ?? this.tertiary,
      border: border ?? this.border,
      borderSecondary: borderSecondary ?? this.borderSecondary,
      borderCritical: borderCritical ?? this.borderCritical,
      borderDisabled: borderDisabled ?? this.borderDisabled,
      borderInfo: borderInfo ?? this.borderInfo,
      borderPrimary: borderPrimary ?? this.borderPrimary,
      borderPrimaryActive: borderPrimaryActive ?? this.borderPrimaryActive,
      borderPrimaryHover: borderPrimaryHover ?? this.borderPrimaryHover,
      borderWarning: borderWarning ?? this.borderWarning,
      borderSuccess: borderSuccess ?? this.borderSuccess,
      text: text ?? this.text,
      textCritical: textCritical ?? this.textCritical,
      textDanger: textDanger ?? this.textDanger,
      textDisabled: textDisabled ?? this.textDisabled,
      textInfo: textInfo ?? this.textInfo,
      textInverse: textInverse ?? this.textInverse,
      textPrimary: textPrimary ?? this.textPrimary,
      textLink: textLink ?? this.textLink,
      textPrimaryActive: textPrimaryActive ?? this.textPrimaryActive,
      textPrimaryHover: textPrimaryHover ?? this.textPrimaryHover,
      textTersiary: textTersiary ?? this.textTersiary,
      textNavigation: textNavigation ?? this.textNavigation,
      textWarning: textWarning ?? this.textWarning,
      textSuccess: textSuccess ?? this.textSuccess,
      successHighlight: successHighlight ?? this.successHighlight,
      toast: toast ?? this.toast,
      surface: surface ?? this.surface,
      surfaceDark: surfaceDark ?? this.surfaceDark,
      surfaceOverlay: surfaceOverlay ?? this.surfaceOverlay,
      workplaceType: workplaceType ?? this.workplaceType,
      jobType: jobType ?? this.jobType,
      experienceLevel: experienceLevel ?? this.experienceLevel,
      compensation: compensation ?? this.compensation,
      education: education ?? this.education,
      skeletonView: skeletonView ?? this.skeletonView,
      bannerWarning: bannerWarning,
      aiCritical: aiCritical ?? this.aiCritical,
      borderAiCritical: borderAiCritical ?? this.borderAiCritical,
      aiGrammar: aiGrammar ?? this.aiGrammar,
      borderAiGrammar: borderAiGrammar ?? this.borderAiGrammar,
      aiPurple: aiPurple ?? this.aiPurple,
    );
  }

  @override
  ThemeExtension<AppColors> lerp(
      covariant ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) {
      return this;
    }
    return AppColors(
      success: Color.lerp(success, other.success, t) ?? success,
      critical: Color.lerp(critical, other.critical, t) ?? critical,
      criticalActive:
          Color.lerp(criticalActive, other.criticalActive, t) ?? criticalActive,
      criticalHighlight:
          Color.lerp(criticalHighlight, other.criticalHighlight, t) ??
              criticalHighlight,
      criticalHighlightActive: Color.lerp(
              criticalHighlightActive, other.criticalHighlightActive, t) ??
          criticalHighlightActive,
      criticalHighlightHover:
          Color.lerp(criticalHighlightHover, other.criticalHighlightHover, t) ??
              criticalHighlightHover,
      criticalHover:
          Color.lerp(criticalHover, other.criticalHover, t) ?? criticalHover,
      mistakeCritical: Color.lerp(mistakeCritical, other.mistakeCritical, t) ??
          mistakeCritical,
      disabled: Color.lerp(disabled, other.disabled, t) ?? disabled,
      ghost: Color.lerp(ghost, other.ghost, t) ?? ghost,
      highlightActive: Color.lerp(highlightActive, other.highlightActive, t) ??
          highlightActive,
      highlightHover:
          Color.lerp(highlightHover, other.highlightHover, t) ?? highlightHover,
      input: Color.lerp(input, other.input, t) ?? input,
      neutralHighlight:
          Color.lerp(neutralHighlight, other.neutralHighlight, t) ??
              neutralHighlight,
      neutralHighlightActive:
          Color.lerp(neutralHighlightActive, other.neutralHighlightActive, t) ??
              neutralHighlightActive,
      neutralHighlightHover:
          Color.lerp(neutralHighlightHover, other.neutralHighlightHover, t) ??
              neutralHighlightHover,
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      primaryActive:
          Color.lerp(primaryActive, other.primaryActive, t) ?? primaryActive,
      primaryHighlight:
          Color.lerp(primaryHighlight, other.primaryHighlight, t) ??
              primaryHighlight,
      primaryHighlightActive:
          Color.lerp(primaryHighlightActive, other.primaryHighlightActive, t) ??
              primaryHighlightActive,
      primaryHighlightHover:
          Color.lerp(primaryHighlightHover, other.primaryHighlightHover, t) ??
              primaryHighlightHover,
      primaryHover:
          Color.lerp(primaryHover, other.primaryHover, t) ?? primaryHover,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      tertiary: Color.lerp(tertiary, other.tertiary, t) ?? tertiary,
      border: Color.lerp(border, other.border, t) ?? border,
      borderSecondary: Color.lerp(borderSecondary, other.borderSecondary, t) ??
          borderSecondary,
      borderCritical:
          Color.lerp(borderCritical, other.borderCritical, t) ?? borderCritical,
      borderDisabled:
          Color.lerp(borderDisabled, other.borderDisabled, t) ?? borderDisabled,
      borderInfo: Color.lerp(borderInfo, other.borderInfo, t) ?? borderInfo,
      borderPrimary:
          Color.lerp(borderPrimary, other.borderPrimary, t) ?? borderPrimary,
      borderPrimaryActive:
          Color.lerp(borderPrimaryActive, other.borderPrimaryActive, t) ??
              borderPrimaryActive,
      borderPrimaryHover:
          Color.lerp(borderPrimaryHover, other.borderPrimaryHover, t) ??
              borderPrimaryHover,
      borderWarning:
          Color.lerp(borderWarning, other.borderWarning, t) ?? borderWarning,
      borderSuccess:
          Color.lerp(borderSuccess, other.borderSuccess, t) ?? borderSuccess,
      text: Color.lerp(text, other.text, t) ?? text,
      textCritical:
          Color.lerp(textCritical, other.textCritical, t) ?? textCritical,
      textDanger: Color.lerp(textDanger, other.textDanger, t) ?? textDanger,
      textDisabled:
          Color.lerp(textDisabled, other.textDisabled, t) ?? textDisabled,
      textInfo: Color.lerp(textInfo, other.textInfo, t) ?? textInfo,
      textInverse: Color.lerp(textInverse, other.textInverse, t) ?? textInverse,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t) ?? textPrimary,
      textLink: Color.lerp(textLink, other.textLink, t) ?? textLink,
      textPrimaryActive:
          Color.lerp(textPrimaryActive, other.textPrimaryActive, t) ??
              textPrimaryActive,
      textPrimaryHover:
          Color.lerp(textPrimaryHover, other.textPrimaryHover, t) ??
              textPrimaryHover,
      textTersiary:
          Color.lerp(textTersiary, other.textTersiary, t) ?? textTersiary,
      textNavigation:
          Color.lerp(textNavigation, other.textNavigation, t) ?? textNavigation,
      textWarning: Color.lerp(textWarning, other.textWarning, t) ?? textWarning,
      textSuccess: Color.lerp(textSuccess, other.textSuccess, t) ?? textSuccess,
      successHighlight:
          Color.lerp(successHighlight, other.successHighlight, t) ??
              successHighlight,
      toast: Color.lerp(toast, other.toast, t) ?? toast,
      surface: Color.lerp(surface, other.surface, t) ?? surface,
      surfaceDark: Color.lerp(surfaceDark, other.surfaceDark, t) ?? surfaceDark,
      surfaceOverlay:
          Color.lerp(surfaceOverlay, other.surfaceOverlay, t) ?? surfaceOverlay,
      workplaceType:
          Color.lerp(workplaceType, other.workplaceType, t) ?? workplaceType,
      jobType: Color.lerp(jobType, other.jobType, t) ?? jobType,
      experienceLevel: Color.lerp(experienceLevel, other.experienceLevel, t) ??
          experienceLevel,
      compensation:
          Color.lerp(compensation, other.compensation, t) ?? compensation,
      education: Color.lerp(education, other.education, t) ?? education,
      skeletonView:
          Color.lerp(skeletonView, other.skeletonView, t) ?? skeletonView,
      bannerWarning:
          Color.lerp(bannerWarning, other.bannerWarning, t) ?? bannerWarning,
      aiCritical: Color.lerp(aiCritical, other.aiCritical, t) ?? aiCritical,
      borderAiCritical:
          Color.lerp(borderAiCritical, other.borderAiCritical, t) ??
              borderAiCritical,
      aiGrammar: Color.lerp(aiGrammar, other.aiGrammar, t) ?? aiGrammar,
      borderAiGrammar: Color.lerp(borderAiGrammar, other.borderAiGrammar, t) ??
          borderAiGrammar,
      aiPurple: Color.lerp(aiPurple, other.aiPurple, t) ?? aiPurple,
    );
  }
}
