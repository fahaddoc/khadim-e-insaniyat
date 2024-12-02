import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppDropdownField<T> extends StatelessWidget {
  final T? selectedValue;
  final List<T> values;
  late final String Function(T value) stringConverter;
  final String? bottomSheetHeading;
  final String? label;
  final String? hint;
  final bool required;
  final bool isDisabled;
  final double? horizontalMargin;
  final Function(T)? onChanged;
  final BoxDecoration? decoration;

  AppDropdownField({
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
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontalMargin ?? 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              "${label!}${required ? '*' : ''}",
              style: AppTextStyles.b14(
                isDisabled ? AppTheme.colors(context).textDisabled : AppTheme.colors(context).text,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 8),
          ],
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  if (isDisabled || values.isEmpty) {
                    return;
                  }
                  // final res = await AppBottomSheets.itemSelection<T>(
                  //   bottomSheetHeading: bottomSheetHeading,
                  //   objects: values,
                  //   objectDisplayNames: values.map((e) => stringConverter(e)).toList(),
                  //   selectedObject: selectedValue,
                  //   statusBarHeight: statusBarHeight(context),
                  // );
                  // if (res is T) {
                  //   if (onChanged != null) onChanged!(res);
                  // }
                },
                child: Container(
                  height: 40,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: decoration ??
                      BoxDecoration(
                        color: isDisabled ? AppTheme.colors(context).disabled : AppTheme.colors(context).surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          width: 1,
                          color: AppTheme.colors(context).border,
                        ),
                      ),
                  child: Text(
                    selectedDisplayValue ?? hint ?? 'Select',
                    style: AppTextStyles.b14(
                      isDisabled
                          ? AppTheme.colors(context).textDisabled
                          : selectedDisplayValue == null
                              ? AppTheme.colors(context).textTersiary
                              : AppTheme.colors(context).text,
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                child: IgnorePointer(
                  ignoring: true,
                  child: Assets.icons.shortArrowDown.image(
                    width: 16,
                    height: 16,
                    color: AppTheme.colors(context).tertiary,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
