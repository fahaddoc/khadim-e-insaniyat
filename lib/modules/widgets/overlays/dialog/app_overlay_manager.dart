import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

enum AppOverlayManagerType { dialog, bottomSheet }

class AppOverlayManager extends StatelessWidget {
  final Widget child;
  final double horizontalPadding;
  final double verticalPadding;
  final double borderRadius;
  final Widget? footer;
  final bool showFooterBorder;
  final bool showHeaderBorder;
  final bool isBodyScrollable;
  final String? title;
  final String? subTitle;
  final Widget? subTextWidget;
  final TextStyle? titleStyle;
  final bool showHeader;
  final bool closeAble;
  final bool showTopHandle;
  final bool showBackButton;
  final Function? onClose;
  final AppOverlayManagerType type;
  final double width;
  final double height;

  const AppOverlayManager({
    super.key,
    required this.child,
    this.width = 600,
    this.height = 800,
    this.horizontalPadding = 24,
    this.verticalPadding = 8,
    this.borderRadius = 32.0,
    this.title,
    this.subTitle,
    this.subTextWidget,
    this.titleStyle,
    this.closeAble = true,
    this.onClose,
    this.footer,
    this.showHeader = true,
    this.showTopHandle = false,
    this.showBackButton = false,
    this.showFooterBorder = true,
    this.showHeaderBorder = false,
    this.isBodyScrollable = false,
    this.type = AppOverlayManagerType.dialog,
  });

  @override
  Widget build(BuildContext context) {
    return _wrapper(
      context,
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.colors(context).surface,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showTopHandle)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: 36,
                    height: 5,
                    decoration: ShapeDecoration(
                      color: AppTheme.colors(context).neutralHighlightActive,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.50),
                      ),
                    ),
                  ),
                ],
              ),
            if (showHeader)
              Padding(
                padding: EdgeInsets.only(
                  top: type == AppOverlayManagerType.bottomSheet ? 24 : 24,
                  left: type == AppOverlayManagerType.bottomSheet ? 16 : 24,
                  right: type == AppOverlayManagerType.bottomSheet ? 16 : 24,
                  bottom: type == AppOverlayManagerType.bottomSheet ? 8 : 0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (showBackButton)
                      Row(
                        children: [
                          AppGestureDetector(
                            onTap: () => onCloseTap(context),
                            builder: (_, onHover) => Container(
                              child: Assets.icons.longArrowLeft.image(),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (title != null)
                            Text(
                              title!,
                              style: titleStyle ?? AppTextStyles.t18(AppTheme.colors(context).text),
                            ),
                          if (subTitle != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Text(
                                subTitle!,
                                style: titleStyle ?? AppTextStyles.b14(AppTheme.colors(context).text),
                              ),
                            ),
                          if(subTextWidget != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: subTextWidget,
                            ),
                        ],
                      ),
                    ),
                    if (closeAble)
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: AppGestureDetector(
                          onTap: () => onCloseTap(context),
                          builder: (context, onHover) => AnimatedContainer(
                              padding: const EdgeInsets.all(5),
                              duration: const Duration(milliseconds: 250),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: onHover ? AppTheme.colors(context).neutralHighlightHover : Colors.white.withOpacity(0),
                              ),
                              child: Assets.icons.cross.image(width: 20, height: 20)),
                        ),
                      )
                  ],
                ),
              ),
            if (showHeaderBorder) ...[
              const SizedBox(height: 16),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.colors(context).border),
                  ),
                ),
              ),
            ],
            if (isBodyScrollable) Expanded(child: _getContent()),
            if (!isBodyScrollable) _getContent(),
            if (footer != null && showFooterBorder)
              Container(
                height: 1,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppTheme.colors(context).border),
                  ),
                ),
              ),
            if (footer != null)
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 24, left: 24, right: 24),
                child: footer,
              ),
          ],
        ),
      ),
    );
  }

  Widget _wrapper(BuildContext context, {required Widget child}) {
    switch (type) {
      case AppOverlayManagerType.dialog:
        return Dialog(
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
          child: Container(
            constraints: BoxConstraints(maxHeight: height, maxWidth: width),
            decoration: ShapeDecoration(
              color: AppTheme.colors(context).surface,
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0xFFE5E7EB)),
                borderRadius: BorderRadius.circular(12),
              ),
              shadows: const [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 20,
                  offset: Offset(0, 12),
                  spreadRadius: 0,
                )
              ],
            ),
            width: width,
            child: child,
          ),
        );
      case AppOverlayManagerType.bottomSheet:
        return BottomSheet(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          ),
          backgroundColor: AppTheme.colors(context).surface,
          constraints: BoxConstraints(maxHeight: height, maxWidth: width),
          onClosing: () => onCloseTap(context),
          builder: (c) => SafeArea(child: child),
        );
    }
  }

  void onCloseTap(BuildContext context) {
    if (onClose != null) onClose!();
    Navigator.of(context).pop();
  }

  Widget _getContent() {
    if (isBodyScrollable) {
      return SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: child,
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: child,
      );
    }
  }
}
