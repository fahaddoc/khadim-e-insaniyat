part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _textFieldContents(BuildContext context, _AppInputFieldState state) {
  return Row(
    children: [
      if (state.widget.prefix != null) ...[
        state.widget.prefix!,
        const SizedBox(width: 8),
      ],
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
            inputFormatters: [
              LengthLimitingTextInputFormatter(state.widget.maxLength),
            ],
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
