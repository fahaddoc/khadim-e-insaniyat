import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class AppDatePicker extends StatefulWidget {
  final String label;
  final ValueChanged<DateTime>? onChange;

  const AppDatePicker({
    super.key,
    required this.label,
    this.onChange,
  });

  @override
  State<AppDatePicker> createState() => _AppDatePicker();
}

class _AppDatePicker extends State<AppDatePicker> {
  late TextEditingController dateController = TextEditingController(
    text: DateFormat('dd, MMMM, yyyy').format(DateTime.now()),
  );
  late FocusNode dateFocusNode = FocusNode();
  OverlayEntry? _overlayEntry;
  bool showDate = false;

  void _toggleDatePickerOverlay() {
    if (showDate) {
      _overlayEntry?.remove();
      _overlayEntry = null;
      showDate = false;
    } else {
      _overlayEntry = _createDatePickerOverlay();
      Overlay.of(context).insert(_overlayEntry!);
      showDate = true;
    }
  }

  OverlayEntry _createDatePickerOverlay() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy + renderBox.size.height,
        width: renderBox.size.width,
        child: Material(
          elevation: 4.0,
          child: SfDateRangePicker(
            onSelectionChanged: _onSelectionChanged,
            selectionMode: DateRangePickerSelectionMode.single,
            initialSelectedDate: DateTime.now(),
            backgroundColor: AppTheme.colors(context).surface,
            toggleDaySelection: true,
            selectionColor: AppTheme.colors(context).primary,
            headerStyle: DateRangePickerHeaderStyle(
              backgroundColor: AppTheme.colors(context).primaryHighlightHover,
              textStyle: AppTextStyles.b16(AppTheme.colors(context).primary)
            ),
          ),
        ),
      ),
    );
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is DateTime) {
      final selectedDate = args.value as DateTime;
      dateController.text = DateFormat('dd, MMMM, yyyy').format(selectedDate);
      widget.onChange?.call(selectedDate);
    }
    _toggleDatePickerOverlay();
  }

  @override
  void dispose() {
    _overlayEntry?.remove();
    dateController.dispose();
    dateFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppInputField.text(
      controller: dateController,
      focusNode: dateFocusNode,
      label: widget.label,
      onTap: _toggleDatePickerOverlay,
    );
  }
}
