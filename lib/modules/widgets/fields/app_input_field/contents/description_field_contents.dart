part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _descriptionFieldContents(BuildContext context, _AppInputFieldState state) {
  return SingleChildScrollView(
    padding: const EdgeInsets.only(bottom: 2),
    child: IgnorePointer(
      ignoring: state.widget.isDisabled,
      child: TextField(
        controller: state.widget.controller,
        focusNode: state.widget.focusNode,
        maxLines: null,
        textCapitalization: TextCapitalization.sentences,
        style: AppTextStyles.b14(
          state.widget.isDisabled ? AppTheme.colors(context).textDisabled : AppTheme.colors(context).text,
        ),
        textInputAction: state.widget.textInputAction,
        onSubmitted: (text) {
          state.autoCompleteOnSubmit();
          if (state.widget.onSubmit != null) {
            state.widget.onSubmit!(text);
          }
        },
        onChanged: state.widget.onChanged,
        inputFormatters: [
          LengthLimitingTextInputFormatter(state.widget.maxLength),
        ],
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.never,
          alignLabelWithHint: true,
          border: InputBorder.none,
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: state.widget.hint,
          hintMaxLines: 3,
          hintStyle: AppTextStyles.b14(
            AppTheme.colors(context).textTersiary,
          ),
        ),
      ),
    ),
  );
}
