import 'package:extended_text_field/extended_text_field.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/core/app_platform.dart';
import 'package:khadim_e_insaniyat/core/core_responsive_builder.dart';
import 'package:khadim_e_insaniyat/extensions/iterable_extentions.dart';
import 'package:khadim_e_insaniyat/helpers/helpers.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_raw_autocomplete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:khadim_e_insaniyat/modules/widgets/chips/selection_tag.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../../../shared/app_text_styles.dart';

part 'contents/comment_field_contents.dart';

part 'contents/currency_field_contents.dart';

part 'contents/description_field_contents.dart';

part 'contents/password_field_contents.dart';

part 'contents/phone_field_contents.dart';

part 'contents/search_field_contents.dart';

part 'contents/tag_field_contents.dart';

part 'contents/text_field_contents.dart';

part 'contents/boolean_field_contents.dart';

part 'contents/numeric_field_contents.dart';

part 'contents/id_card_field_contents.dart';

class AutoCompleteFieldOptions<K extends Object> {
  final List<K> initialOptions;
  final Future<List<K>?> Function(String)? dataProvider;
  final ValueChanged<K> onSelection;
  final BoxDecoration? containerDecoration;
  final EdgeInsets? containerPadding;
  final Widget Function(BuildContext, K?, ValueChanged<K>)? itemBuilder;
  late final String Function(K) optionTranslator;

  AutoCompleteFieldOptions({
    required this.initialOptions,
    this.dataProvider,
    required this.onSelection,
    this.containerDecoration,
    this.containerPadding,
    this.itemBuilder,
    String Function(K)? searchFilterBuilder,
  }) {
    this.optionTranslator = searchFilterBuilder ?? (v) => v.toString();
  }
}

class AppInputField<A extends Object> extends StatefulWidget {
  final double? height;
  final List<A>? selectedTags;
  final Function(A)? onTagCancel;
  final AppInputFieldType fieldType;
  final TextInputAction? textInputAction;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? label;
  final String? hint;
  final String? error;
  final String? helperText;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool isDisabled;
  final bool required;
  final int? maxLength;
  final double? horizontalMargin;
  final double? borderRadius;
  final Widget? prefix;
  final Widget? suffix;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final VoidCallback? onFocusOut;
  final VoidCallback? onTap;
  final VoidCallback? onClearSearch;
  final AutoCompleteFieldOptions<A>? autoCompleteFieldOptions;

  const AppInputField._({
    super.key,
    this.height,
    this.selectedTags,
    this.onTagCancel,
    required this.fieldType,
    this.textInputAction,
    required this.controller,
    required this.focusNode,
    this.label,
    this.hint,
    this.error,
    this.helperText,
    this.backgroundColor,
    this.borderColor,
    this.isDisabled = false,
    this.required = false,
    this.maxLength,
    this.horizontalMargin,
    this.borderRadius,
    this.prefix,
    this.suffix,
    this.onChanged,
    this.onSubmit,
    this.onFocusOut,
    this.onTap,
    this.onClearSearch,
    this.autoCompleteFieldOptions,
  });

  factory AppInputField.text({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
    double? borderRadius,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.text,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      borderRadius: borderRadius,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.phone({
    Key? key,
    required PhoneNumberController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.phone,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.tag({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    required List<A> selectedTags,
    required Function(A) onTagCancel,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    required AutoCompleteFieldOptions<A> autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.tag,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      selectedTags: selectedTags,
      onTagCancel: onTagCancel,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.currency({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.currency,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.password({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.password,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.description({
    Key? key,
    double? height,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.description,
      height: height,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.search({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Widget? prefix,
    double? borderRadius,
    double? height,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    VoidCallback? onClearSearch,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.search,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      height: height,
      onClearSearch: onClearSearch,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.comment({
    Key? key,
    double? height,
    required TextEditingController controller,
    required FocusNode focusNode,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    double? horizontalMargin,
    Widget? prefix,
    double? borderRadius,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.comment,
      height: height,
      controller: controller,
      focusNode: focusNode,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      borderRadius: borderRadius,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.boolean({
    Key? key,
    double? height,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.boolean,
      height: height,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.numeric({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
    double? borderRadius,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.numeric,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      borderRadius: borderRadius,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  factory AppInputField.identity({
    Key? key,
    required TextEditingController controller,
    required FocusNode focusNode,
    TextInputAction? textInputAction,
    String? label,
    String? hint,
    String? error,
    String? helperText,
    Color? backgroundColor,
    Color? borderColor,
    bool isDisabled = false,
    bool required = false,
    int? maxLength,
    double? horizontalMargin,
    Widget? prefix,
    Widget? suffix,
    Function(String)? onChanged,
    Function(String)? onSubmit,
    VoidCallback? onFocusOut,
    VoidCallback? onTap,
    AutoCompleteFieldOptions<A>? autoCompleteFieldOptions,
    double? borderRadius,
  }) {
    return AppInputField._(
      key: key,
      fieldType: AppInputFieldType.identity,
      controller: controller,
      focusNode: focusNode,
      textInputAction: textInputAction,
      label: label,
      hint: hint,
      error: error,
      helperText: helperText,
      backgroundColor: backgroundColor,
      borderColor: borderColor,
      isDisabled: isDisabled,
      required: required,
      maxLength: maxLength,
      horizontalMargin: horizontalMargin,
      prefix: prefix,
      suffix: suffix,
      onChanged: onChanged,
      onSubmit: onSubmit,
      onFocusOut: onFocusOut,
      borderRadius: borderRadius,
      onTap: onTap,
      autoCompleteFieldOptions: autoCompleteFieldOptions,
    );
  }

  @override
  State<AppInputField<A>> createState() => _AppInputFieldState<A>();
}

class _AppInputFieldState<T extends Object> extends State<AppInputField<T>> {
  bool hidePassword = true;
  bool isHovered = false;
  bool isLoading = false;

  Widget? get suffix {
    if (isLoading) {
      return SizedBox(
        height: 18,
        width: 18,
        child: Assets.icons.inputLoader.rive(),
      );
    }
    return widget.suffix;
  }

  @override
  void initState() {
    widget.focusNode.addListener(_focusListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_focusListener);
    super.dispose();
  }

  updateField() {
    setState(() {});
  }

  AutoCompleteFieldOptions<T>? get autoCompleteOptions =>
      widget.autoCompleteFieldOptions;
  void Function() autoCompleteOnSubmit = () {};

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.label != null) ...[
            Row(
              children: [
                AppGestureDetector(
                  onTap: () =>
                      FocusScope.of(context).requestFocus(widget.focusNode),
                  builder: (_, __) => Text(
                    widget.label!,
                    style: AppTextStyles.b14(
                      AppTheme.colors(context).text,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                if (widget.required)
                  Padding(
                    padding: const EdgeInsets.only(left: 2),
                    child: Text(
                      '*',
                      style:
                          AppTextStyles.b14(AppTheme.colors(context).primary),
                    ),
                  )
              ],
            ),
            const SizedBox(height: 8),
          ],
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  if (widget.isDisabled) {
                    return;
                  }
                  FocusScope.of(context).requestFocus(widget.focusNode);
                  setState(() {});
                },
                child: MouseRegion(
                  cursor: widget.onTap == null
                      ? SystemMouseCursors.text
                      : SystemMouseCursors.click,
                  onHover: (event) => setState(() {
                    if (!(AppPlatform.isAndroid || AppPlatform.isIOS)) {
                      isHovered = true;
                    }
                  }),
                  onExit: (event) => setState(() {
                    if (!(AppPlatform.isAndroid || AppPlatform.isIOS)) {
                      isHovered = false;
                    }
                  }),
                  child: autoCompleteOptions == null
                      ? AnimatedContainer(
                          duration: const Duration(milliseconds: 150),
                          height: widget.height ?? _height(),
                          alignment: _alignment(),
                          padding:
                              _padding().add(EdgeInsets.all(2 - _borderSize())),
                          constraints: const BoxConstraints(minHeight: 40),
                          decoration: BoxDecoration(
                            color: _backgroundColor(),
                            borderRadius: _borderRadius(),
                            border: Border.all(
                              width: _borderSize(),
                              color: _borderColor(),
                            ),
                            boxShadow: _boxShadow(),
                          ),
                          child: _fieldContents(),
                        )
                      : LayoutBuilder(
                          builder: (context, constraints) =>
                              AppRawAutocomplete<T>(
                            textEditingController: widget.controller,
                            focusNode: widget.focusNode,
                            displayStringForOption:
                                autoCompleteOptions?.optionTranslator ??
                                    (v) => v.toString(),
                            fieldViewBuilder:
                                (context, controller, focusNode, onSubmit) {
                              autoCompleteOnSubmit = onSubmit;
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 150),
                                height: widget.height ?? _height(),
                                alignment: _alignment(),
                                padding: _padding()
                                    .add(EdgeInsets.all(2 - _borderSize())),
                                constraints:
                                    const BoxConstraints(minHeight: 40),
                                decoration: BoxDecoration(
                                  color: _backgroundColor(),
                                  borderRadius: _borderRadius(),
                                  border: Border.all(
                                    width: _borderSize(),
                                    color: _borderColor(),
                                  ),
                                  boxShadow: _boxShadow(),
                                ),
                                child: _fieldContents(),
                              );
                            },
                            optionsViewBuilder: (context, onSelect, options) =>
                                _dropdownBuilder(
                                    context, onSelect, options, constraints),
                            optionsBuilder: _dropdownOptionsSorter,
                            onSelected: autoCompleteOptions?.onSelection,
                          ),
                        ),
                ),
              ),
              if (widget.onTap != null)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                    ),
                  ),
                ),
            ],
          ),
          if ((widget.helperText?.isNotEmpty ?? false) &&
              (widget.error?.isEmpty ?? true))
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                widget.helperText!,
                style: AppTextStyles.c12(
                  AppTheme.colors(context).textTersiary,
                ),
              ),
            ),
          if (widget.error?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(
                widget.error!,
                style: AppTextStyles.c12(
                  AppTheme.colors(context).critical,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _dropdownBuilder(BuildContext context, void Function(T) onSelect,
      Iterable<T> options, BoxConstraints constraints) {
    return Align(
      alignment: Alignment.topLeft,
      child: Material(
        child: Container(
          margin: const EdgeInsets.only(top: 7),
          height: (40.0 * (options.length > 4 ? 4 : options.length)) + 16,
          width: constraints.biggest.width,
          padding:
              autoCompleteOptions?.containerPadding ?? const EdgeInsets.all(8),
          clipBehavior: Clip.antiAlias,
          decoration: autoCompleteOptions?.containerDecoration ??
              ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: AppTheme.colors(context).border),
                  borderRadius: BorderRadius.circular(12),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x19000000),
                    blurRadius: 8,
                    offset: Offset(0, 4),
                    spreadRadius: 0,
                  )
                ],
              ),
          // <-- Right here !
          child: ListView(
            children: options
                .map((option) => autoCompleteOptions?.itemBuilder != null
                    ? autoCompleteOptions!.itemBuilder!(
                        context, option, onSelect)
                    : AppGestureDetector(
                        onTap: () => onSelect(option),
                        builder: (ctx, onHover) {
                          return AnimatedContainer(
                            height: 40,
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                                color: onHover
                                    ? AppTheme.colors(context).neutralHighlight
                                    : Colors.white.withOpacity(0),
                                borderRadius: BorderRadius.circular(24)),
                            duration: const Duration(milliseconds: 150),
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              option is String
                                  ? option.toString()
                                  : (autoCompleteOptions
                                          ?.optionTranslator(option))
                                      .toString(),
                              style: AppTextStyles.b14(
                                AppTheme.colors(context).text,
                              ),
                            ),
                          );
                        },
                      ))
                .toList(),
          ),
        ),
      ),
    );
  }

  Future<Iterable<T>> _dropdownOptionsSorter(
      TextEditingValue textEditingValue) async {
    if (textEditingValue.text == '' || autoCompleteOptions == null) {
      return Iterable<T>.empty();
    }
    if (autoCompleteOptions!.dataProvider != null) {
      Iterable<T> result = [];
      setState(() {
        isLoading = true;
      });
      try {
        result =
            (await autoCompleteOptions!.dataProvider!(textEditingValue.text)) ??
                [];
      } catch (e) {
        print(e);
        // logJson('Unable to fetch dropdown values: $T');
      }
      setState(() {
        isLoading = false;
      });
      return result;
    }

    if (T is String) {
      return Future<List<T>>.value(
        autoCompleteOptions!.initialOptions
            .map((e) => e.toString())
            .filter(textEditingValue.text)
            .map((e) => e as T)
            .toList(),
      );
    }

    return Future<List<T>>.value(
      autoCompleteOptions!.initialOptions
          .filter(textEditingValue.text, autoCompleteOptions!.optionTranslator)
          .toList(),
    );
  }

  Widget _fieldContents() {
    switch (widget.fieldType) {
      case AppInputFieldType.text:
        return _textFieldContents(context, this);
      case AppInputFieldType.phone:
        return _phoneFieldContents(context, this);
      case AppInputFieldType.tag:
        return _tagFieldContents<T>(context, this);
      case AppInputFieldType.currency:
        return _currencyFieldContents(context, this);
      case AppInputFieldType.password:
        return _passwordFieldContents(context, this);
      case AppInputFieldType.description:
        return _descriptionFieldContents(context, this);
      case AppInputFieldType.search:
        return _searchFieldContents(context, this);
      case AppInputFieldType.comment:
        return _commentFieldContents(context, this);
      case AppInputFieldType.boolean:
        return _booleanFieldContents(context, this);
      case AppInputFieldType.numeric:
        return _numericFieldContents(context, this);
      case AppInputFieldType.identity:
        return _idCardFieldContents(context, this);
    }
  }

  double? _height() {
    if (widget.fieldType == AppInputFieldType.comment) {
      return null;
    }
    if (widget.onTap != null && widget.fieldType == AppInputFieldType.text) {
      return null;
    }
    if (widget.fieldType == AppInputFieldType.tag) {
      return null;
    }
    if (widget.fieldType == AppInputFieldType.numeric) {
      return 20;
    }
    if (widget.fieldType == AppInputFieldType.identity) {
      return 20;
    }
    if (widget.fieldType == AppInputFieldType.description) {
      return 110;
    }
    if (widget.fieldType == AppInputFieldType.boolean) {
      return 110;
    }
    return 40;
  }

  AlignmentGeometry? _alignment() {
    if (widget.fieldType == AppInputFieldType.comment) {
      return Alignment.centerLeft;
    }
    if (widget.fieldType == AppInputFieldType.description) {
      return Alignment.topLeft;
    }
    return Alignment.center;
  }

  EdgeInsetsGeometry _padding() {
    switch (widget.fieldType) {
      case AppInputFieldType.text:
      case AppInputFieldType.phone:
      case AppInputFieldType.numeric:
      case AppInputFieldType.identity:
        return const EdgeInsets.symmetric(horizontal: 16);
      case AppInputFieldType.tag:
        return const EdgeInsets.symmetric(horizontal: 8, vertical: 8);
      case AppInputFieldType.currency:
        return const EdgeInsets.symmetric(horizontal: 16);
      case AppInputFieldType.password:
        return const EdgeInsets.only(left: 16, right: 8);
      case AppInputFieldType.boolean:
      case AppInputFieldType.description:
        return const EdgeInsets.symmetric(horizontal: 16);
      case AppInputFieldType.search:
        return const EdgeInsets.only(left: 16, right: 8);
      case AppInputFieldType.comment:
        return const EdgeInsets.all(12);
    }
  }

  List<BoxShadow> _boxShadow() {
    if (widget.fieldType == AppInputFieldType.comment) {
      return [];
    }
    if (widget.fieldType == AppInputFieldType.search) {
      return [];
    }
    if (widget.error == null && widget.focusNode.hasFocus) {
      return <BoxShadow>[
        BoxShadow(
          color: AppTheme.colors(context).primary.withOpacity(0.3),
          spreadRadius: 2,
        )
      ];
    }
    if (widget.error != null && widget.focusNode.hasFocus) {
      return <BoxShadow>[
        BoxShadow(
          color: AppTheme.colors(context).critical.withOpacity(0.3),
          spreadRadius: 2,
        )
      ];
    }
    return <BoxShadow>[];
  }

  Color _borderColor() {
    if (widget.isDisabled) {
      return widget.borderColor ?? AppTheme.colors(context).border;
    }
    if (widget.fieldType == AppInputFieldType.comment) {
      return widget.borderColor ??
          AppTheme.colors(context).neutralHighlightHover;
    }
    if (widget.fieldType == AppInputFieldType.search) {
      if (widget.focusNode.hasFocus) return AppTheme.colors(context).border;
      return widget.borderColor ??
          AppTheme.colors(context).neutralHighlightHover;
    }

    if (!isHovered && widget.error == null && !widget.focusNode.hasFocus) {
      return widget.borderColor ?? AppTheme.colors(context).border;
    }
    if (!isHovered && widget.error != null && !widget.focusNode.hasFocus) {
      return AppTheme.colors(context).critical;
    }
    if (!isHovered && widget.error == null && widget.focusNode.hasFocus) {
      return AppTheme.colors(context).primary;
    }
    if (!isHovered && widget.error != null && widget.focusNode.hasFocus) {
      return AppTheme.colors(context).critical;
    }
    if (isHovered && widget.error == null) {
      return AppTheme.colors(context).primary;
    }
    if (isHovered && widget.error != null) {
      return AppTheme.colors(context).critical;
    }
    return widget.borderColor ?? AppTheme.colors(context).border;
  }

  double _borderSize() {
    if (!widget.focusNode.hasFocus && !isHovered) {
      return 1;
    }
    if (widget.focusNode.hasFocus) {
      return 1;
    }
    return 2;
  }

  BorderRadius _borderRadius() {
    if (widget.borderRadius != null) {
      return BorderRadius.circular(widget.borderRadius!);
    }
    if (widget.fieldType == AppInputFieldType.search) {
      return BorderRadius.circular(100);
    }
    return BorderRadius.circular(12);
  }

  _backgroundColor() {
    if (widget.isDisabled) {
      return AppTheme.colors(context).disabled;
    }
    if (widget.fieldType == AppInputFieldType.comment) {
      return widget.backgroundColor ??
          AppTheme.colors(context).neutralHighlightHover;
    }
    if (widget.fieldType == AppInputFieldType.search) {
      if (isHovered && !widget.focusNode.hasFocus) {
        return AppTheme.colors(context).neutralHighlightHover;
      }

      if (widget.focusNode.hasFocus) {
        return AppTheme.colors(context).surface;
      }
    }
    return widget.backgroundColor ?? AppTheme.colors(context).surface;
  }

  void _focusListener() {
    if (!widget.focusNode.hasFocus) {
      if (widget.onFocusOut != null) {
        widget.onFocusOut!();
      }
    }
    setState(() {});
  }
}

enum AppInputFieldType {
  text,
  phone,
  tag,
  currency,
  password,
  description,
  search,
  comment,
  boolean,
  numeric,
  identity,
}
