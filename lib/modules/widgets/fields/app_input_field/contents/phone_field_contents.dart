part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _phoneFieldContents(BuildContext context, _AppInputFieldState state) {
  return Row(
    children: [
      Text(
        '+1',
        style: AppTextStyles.b14((state.widget.focusNode.hasFocus || state.widget.controller.text.isNotEmpty)
            ? AppTheme.colors(context).text
            : AppTheme.colors(context).textTersiary),
      ),
      const SizedBox(width: 4),
      Expanded(
        child: IgnorePointer(
          ignoring: state.widget.isDisabled,
          child: TextField(
            controller: state.widget.controller,
            focusNode: state.widget.focusNode,
            style: AppTextStyles.b14(
              state.widget.isDisabled ? AppTheme.colors(context).textDisabled : AppTheme.colors(context).text,
            ),
            onSubmitted: (text) {
              state.autoCompleteOnSubmit();
              if (state.widget.onSubmit != null) {
                state.widget.onSubmit!(text);
              }
            },
            inputFormatters: [(state.widget.controller as PhoneNumberController).formatter],
            onChanged: state.widget.onChanged,
            textInputAction: state.widget.textInputAction,
            maxLines: 1,
            decoration: InputDecoration(
              isCollapsed: true,
              floatingLabelBehavior: FloatingLabelBehavior.never,
              alignLabelWithHint: true,
              border: InputBorder.none,
              hintText: state.widget.hint,
              hintStyle: AppTextStyles.b14(
                AppTheme.colors(context).textTersiary,
              ),
            ),
          ),
        ),
      ),
      if (state.suffix != null) ...[
        const SizedBox(width: 8),
        state.suffix!,
      ],
    ],
  );
}

class PhoneNumberController extends TextEditingController {
  PhoneNumberController({super.text});

  MaskTextInputFormatter formatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.eager,
  );

  String get unmaskedText => formatter.unmaskText(text);

  maskAndUpdateValue(String text) {
    this.text = formatter.maskText(text);
  }
}
