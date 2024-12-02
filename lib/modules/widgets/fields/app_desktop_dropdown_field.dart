import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/gesture_detector/app_gesture_detector.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppDesktopDropdownField<T> extends StatelessWidget {
  final T? selectedValue;
  final List<T> values;
  late final String Function(T value) stringConverter;
  final String? bottomSheetHeading;
  final String? label;
  final String? hint;
  final bool required;
  final bool isDisabled;
  final double? horizontalMargin;
  final double height;
  final BoxDecoration? decoration;
  final Function(T)? onChanged;

  AppDesktopDropdownField({
    super.key,
    this.values = const [],
    String Function(T value)? stringConverter,
    this.selectedValue,
    this.bottomSheetHeading,
    this.label,
    this.hint,
    this.required = false,
    this.isDisabled = false,
    this.horizontalMargin,
    this.onChanged,
    this.height = 40,
    this.decoration,
  }) {
    this.stringConverter = stringConverter ?? (_) => _.toString();
  }

  String? get selectedDisplayValue {
    if (selectedValue == null) {
      return null;
    }
    return stringConverter(selectedValue as T);
  }

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isDisabled,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (label != null) ...[
              Row(
                children: [
                  Text(
                    label!,
                    style: AppTextStyles.b14(
                      isDisabled ? AppTheme.colors(context).textDisabled : AppTheme.colors(context).text,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (required)
                    Padding(
                      padding: const EdgeInsets.only(left: 2),
                      child: Text(
                        '*',
                        style: AppTextStyles.b14(AppTheme.colors(context).primary),
                      ),
                    )
                ],
              ),
              const SizedBox(height: 8),
            ],
            DropdownButtonHideUnderline(
              child: DropdownButton2<T>(
                isExpanded: true,
                hint: Text(
                  hint ?? 'Select',
                  style: AppTextStyles.b14(
                      isDisabled ? AppTheme.colors(context).textTersiary : AppTheme.colors(context).textTersiary),
                ),
                selectedItemBuilder: (context) => List.generate(
                  values.length,
                  (index) => Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      stringConverter(values[index]),
                      style:
                          AppTextStyles.b14(isDisabled ? AppTheme.colors(context).textTersiary : AppTheme.colors(context).text),
                    ),
                  ),
                ),
                items: List.generate(
                  values.length,
                  (index) => DropdownMenuItem(
                    value: values[index],
                    child: Semantics(
                      identifier: 'dropdownItem',
                      child: AppGestureDetector(
                        builder: (ctx, onHover) => AnimatedContainer(
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              color: isDisabled
                                  ? AppTheme.colors(context).disabled
                                  : onHover
                                      ? AppTheme.colors(context).neutralHighlight
                                      : AppTheme.colors(context).surface,
                              borderRadius: BorderRadius.circular(24)),
                          duration: const Duration(milliseconds: 100),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            stringConverter(values[index]),
                            style: AppTextStyles.b14(
                              AppTheme.colors(context).text,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                value: selectedValue,
                onChanged: (res) {
                  if (onChanged != null && res != null) {
                    onChanged!(res);
                  }
                },
                buttonStyleData: ButtonStyleData(
                  height: height,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  decoration: decoration ??
                      BoxDecoration(
                        color: isDisabled ? AppTheme.colors(context).disabled : AppTheme.colors(context).input,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: AppTheme.colors(context).border,
                        ),
                      ),
                  elevation: 0,
                ),
                iconStyleData: IconStyleData(
                  icon: Assets.icons.shortArrowDown.image(
                    width: 16,
                    height: 16,
                    color: AppTheme.colors(context).tertiary,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  maxHeight: 200,
                  elevation: 2,
                  padding: const EdgeInsets.all(8),
                  offset: const Offset(0, -10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: AppTheme.colors(context).surfaceOverlay,
                    border: Border.all(
                      width: 1,
                      color: AppTheme.colors(context).border,
                    ),
                  ),
                ),
                menuItemStyleData: MenuItemStyleData(
                  height: 40,
                  padding: EdgeInsets.zero,
                  overlayColor: WidgetStateColor.resolveWith((states) => Colors.transparent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
