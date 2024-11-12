import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final AppButtonType type;
  final AppButtonSize size;
  final double? width;
  final double? height;
  final Color? color;
  final Color? hoverColor;
  final double? horizontalMargin;
  final bool fitToText;
  final bool isDisabled;
  final VoidCallback? onTap;
  final String? label;
  final String? tag;
  final TextStyle? labelStyle;
  final Widget? leading;
  final AssetGenImage? leadingIcon;
  final Color? leadingIconColor;
  final Widget? trailing;
  final AssetGenImage? trailingIcon;
  final Color? trailingIconColor;
  final bool isLoading;
  final Color? borderColor;
  final int? badgeCount;

  const AppButton._({
    super.key,
    required this.type,
    required this.size,
    this.width,
    this.height,
    this.color,
    this.hoverColor,
    this.horizontalMargin,
    this.fitToText = false,
    this.isDisabled = false,
    this.onTap,
    this.label,
    this.tag,
    this.labelStyle,
    this.leading,
    this.leadingIcon,
    this.leadingIconColor,
    this.trailing,
    this.trailingIcon,
    this.trailingIconColor,
    this.isLoading = false,
    this.borderColor,
    this.badgeCount,
  });

  factory AppButton.primary({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    Color? color,
    Color? hoverColor,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    String? tag,
    TextStyle? labelStyle,
    Widget? leading,
    AssetGenImage? leadingIcon,
    Color? leadingIconColor,
    Widget? trailing,
    AssetGenImage? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.primary,
      size: size,
      width: width,
      height: height,
      color: color,
      hoverColor: hoverColor,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      tag: tag,
      labelStyle: labelStyle,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailing: trailing,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.outline({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    Color? color,
    Color? hoverColor,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    String? tag,
    TextStyle? labelStyle,
    Widget? leading,
    AssetGenImage? leadingIcon,
    Color? leadingIconColor,
    Widget? trailing,
    AssetGenImage? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
    Color? borderColor,
    int? badgeCount,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.outline,
      size: size,
      width: width,
      height: height,
      color: color,
      hoverColor: hoverColor,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      tag: tag,
      labelStyle: labelStyle,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailing: trailing,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
      borderColor: borderColor,
      badgeCount: badgeCount,
    );
  }

  factory AppButton.ghostPrimary({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    Color? color,
    Color? hoverColor,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    String? tag,
    TextStyle? labelStyle,
    Widget? leading,
    AssetGenImage? leadingIcon,
    Color? leadingIconColor,
    Widget? trailing,
    AssetGenImage? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.ghostPrimary,
      size: size,
      width: width,
      height: height,
      color: color,
      hoverColor: hoverColor,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      tag: tag,
      labelStyle: labelStyle,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailing: trailing,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.ghostNeutral({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    Color? color,
    Color? hoverColor,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    String? tag,
    TextStyle? labelStyle,
    Widget? leading,
    AssetGenImage? leadingIcon,
    Color? leadingIconColor,
    Widget? trailing,
    AssetGenImage? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.ghostNeutral,
      size: size,
      width: width,
      height: height,
      color: color,
      hoverColor: hoverColor,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      tag: tag,
      labelStyle: labelStyle,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailing: trailing,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  factory AppButton.danger({
    Key? key,
    required AppButtonSize size,
    double? width,
    double? height,
    Color? color,
    Color? hoverColor,
    double? horizontalMargin,
    bool fitToText = false,
    bool isDisabled = false,
    VoidCallback? onTap,
    String? label,
    String? tag,
    TextStyle? labelStyle,
    Widget? leading,
    AssetGenImage? leadingIcon,
    Color? leadingIconColor,
    Widget? trailing,
    AssetGenImage? trailingIcon,
    Color? trailingIconColor,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      type: AppButtonType.danger,
      size: size,
      width: width,
      height: height,
      color: color,
      hoverColor: hoverColor,
      horizontalMargin: horizontalMargin,
      fitToText: fitToText,
      isDisabled: isDisabled,
      onTap: onTap,
      label: label,
      tag: tag,
      labelStyle: labelStyle,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingIconColor: leadingIconColor,
      trailing: trailing,
      trailingIcon: trailingIcon,
      trailingIconColor: trailingIconColor,
      isLoading: isLoading,
    );
  }

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  late bool isHovered;
  late bool isActive;

  @override
  void initState() {
    isHovered = false;
    isActive = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      identifier: 'button',
      child: GestureDetector(
        onTapUp: (details) async {
          if (isActive) {
            setState(() {
              isActive = false;
            });
          }
          if (!widget.isDisabled && !widget.isLoading) {
            if (widget.onTap != null) {
              widget.onTap!();
            }
          }
        },
        onTapDown: (details) {
          if (!isActive) {
            setState(() {
              isActive = true;
            });
          }
        },
        onTapCancel: () {
          if (isActive) {
            setState(() {
              isActive = false;
            });
          }
        },
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onHover: (event) {
            isHovered = true;
            setState(() {});
          },
          onExit: (event) {
            isHovered = false;
            setState(() {});
          },
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: widget.height ?? _heightFromSize(widget.size),
                width: widget.fitToText ? null : widget.width,
                alignment: widget.fitToText ? null : Alignment.center,
                padding: _paddingFromSize(widget.size),
                margin: EdgeInsets.symmetric(horizontal: widget.horizontalMargin ?? 0),
                decoration: BoxDecoration(
                  color: widget.color ?? _colorFromType(widget.type),
                  borderRadius: BorderRadius.circular(100),
                  border: _borderFromType(widget.type),
                ),
                child: Opacity(
                  opacity: widget.isLoading ? 0 : 1,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.leadingIcon != null || widget.leading != null) ...[
                        widget.leading ??
                            widget.leadingIcon!.image(
                              width: _iconWidthFromSize(widget.size),
                              height: _iconHeightFromSize(widget.size),
                              color: _leadingIconColor(),
                            ),
                        if (widget.label != null) const SizedBox(width: 8),
                      ],
                      if (widget.label != null)
                        Flexible(
                          child: Text(
                            widget.label!,
                            style: widget.labelStyle ?? _labelStyleFromType(widget.type),
                          ),
                        ),
                      if (widget.trailingIcon != null || widget.trailing != null) ...[
                        if (widget.label != null) const SizedBox(width: 8),
                        widget.trailing ??
                            widget.trailingIcon!.image(
                              width: _iconWidthFromSize(widget.size),
                              height: _iconHeightFromSize(widget.size),
                              color: _trailingIconColor(),
                            ),
                      ],
                    ],
                  ),
                ),
              ),
              if (widget.badgeCount != null && widget.badgeCount! > 0)
                Positioned(
                  right: 0,
                  top: -5,
                  child: Container(
                    alignment: Alignment.center,
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                        color: widget.borderColor ?? AppTheme.colors(context).border,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.white, width: 1)),
                    child: Text(
                      "${widget.badgeCount}",
                      style: AppTextStyles.u10(Colors.white),
                    ),
                  ),
                ),
              if (widget.isLoading)
                Positioned.fill(
                  child: Center(
                    child: SizedBox(
                      // <-- Change according to design after design is completed
                      width: _loadingIndicatorSizeFromButtonSize(),
                      height: _loadingIndicatorSizeFromButtonSize(),
                      child: FittedBox(
                        child: CircularProgressIndicator(
                          color: _contentColor(widget.type),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  double _loadingIndicatorSizeFromButtonSize() {
    switch (widget.size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 18;
      case AppButtonSize.large:
        return 22;
      case AppButtonSize.xLarge:
        return 25;
    }
  }

  BoxBorder? _borderFromType(AppButtonType type) {
    if (widget.borderColor != null) {
      return Border.all(
        width: 1,
        color: widget.borderColor!,
      );
    }

    switch (type) {
      case AppButtonType.outline:
        return Border.all(
          width: 1,
          color: AppTheme.colors(context).border,
        );
      default:
        return null;
    }
  }

  TextStyle _labelStyleFromType(AppButtonType type) {
    switch (widget.size) {
      case AppButtonSize.small:
        return AppTextStyles.l12(
          _contentColor(type),
        );
      case AppButtonSize.medium:
        return AppTextStyles.t14(
          _contentColor(type),
        );
      case AppButtonSize.large:
        return AppTextStyles.t14(
          _contentColor(type),
        );
      case AppButtonSize.xLarge:
        return AppTextStyles.t14(
          _contentColor(type),
        );
    }
  }

  Color _contentColor(AppButtonType type) {
    if (widget.isDisabled) {
      return AppTheme.colors(context).textDisabled;
    }
    switch (type) {
      case AppButtonType.primary:
        return AppTheme.colors(context).textInverse;
      case AppButtonType.outline:
        return AppTheme.colors(context).text;
      case AppButtonType.ghostPrimary:
        return AppTheme.colors(context).primary;
      case AppButtonType.ghostNeutral:
        return AppTheme.colors(context).text;
      case AppButtonType.danger:
        return AppTheme.colors(context).textInverse;
    }
  }

  double _iconWidthFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 20;
      case AppButtonSize.xLarge:
        return 20;
    }
  }

  double _iconHeightFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 16;
      case AppButtonSize.medium:
        return 20;
      case AppButtonSize.large:
        return 20;
      case AppButtonSize.xLarge:
        return 20;
    }
  }

  Color? _leadingIconColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).textDisabled;
    }
    return widget.leadingIconColor ?? _contentColor(widget.type);
  }

  Color? _trailingIconColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).textDisabled;
    }
    return widget.trailingIconColor ?? _contentColor(widget.type);
  }

  double _heightFromSize(AppButtonSize size) {
    switch (size) {
      case AppButtonSize.small:
        return 32;
      case AppButtonSize.medium:
        return 40;
      case AppButtonSize.large:
        return 48;
      case AppButtonSize.xLarge:
        return 56;
    }
  }

  EdgeInsetsGeometry _paddingFromSize(AppButtonSize size) {
    bool isOutlineButton = widget.type == AppButtonType.outline;
    switch (size) {
      case AppButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12 - (isOutlineButton ? 1 : 0));
      case AppButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16 - (isOutlineButton ? 1 : 0));
      case AppButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 16 - (isOutlineButton ? 1 : 0));
      case AppButtonSize.xLarge:
        return EdgeInsets.symmetric(horizontal: 24 - (isOutlineButton ? 1 : 0));
    }
  }

  Color _colorFromType(AppButtonType type) {
    switch (type) {
      case AppButtonType.primary:
        return _primaryButtonColor();
      case AppButtonType.outline:
        return _outlineButtonColor();
      case AppButtonType.ghostPrimary:
        return _ghostPrimaryButtonColor();
      case AppButtonType.ghostNeutral:
        return _ghostNeutralButtonColor();
      case AppButtonType.danger:
        return _dangerButtonColor();
    }
  }

  Color _primaryButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabled;
    }
    if (isActive) {
      return AppTheme.colors(context).primaryActive;
    }
    if (isHovered) {
      return widget.hoverColor ?? AppTheme.colors(context).primaryHover;
    }
    return AppTheme.colors(context).primary;
  }

  Color _outlineButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).ghost.withOpacity(0);
    }
    if (isActive) {
      return AppTheme.colors(context).highlightHover;
    }
    if (isHovered) {
      return widget.hoverColor ?? AppTheme.colors(context).neutralHighlight;
    }
    return AppTheme.colors(context).ghost.withOpacity(0);
  }

  Color _ghostPrimaryButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabled;
    }
    if (isActive) {
      return AppTheme.colors(context).primaryHighlightHover;
    }
    if (isHovered) {
      return widget.hoverColor ?? AppTheme.colors(context).primaryHighlight;
    }
    return AppTheme.colors(context).ghost.withOpacity(0);
  }

  Color _ghostNeutralButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabled;
    }
    if (isActive) {
      return AppTheme.colors(context).highlightHover;
    }
    if (isHovered) {
      return widget.hoverColor ?? AppTheme.colors(context).neutralHighlight;
    }
    return AppTheme.colors(context).ghost.withOpacity(0);
  }

  Color _dangerButtonColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabled;
    }
    if (isActive) {
      return AppTheme.colors(context).criticalActive;
    }
    if (isHovered) {
      return widget.hoverColor ?? AppTheme.colors(context).criticalHover;
    }
    return AppTheme.colors(context).critical;
  }
}

enum AppButtonType {
  primary,
  outline,
  ghostPrimary,
  ghostNeutral,
  danger,
}

enum AppButtonSize {
  small,
  medium,
  large,
  xLarge,
}
