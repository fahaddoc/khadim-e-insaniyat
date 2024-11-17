part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _idCardFieldContents(BuildContext context, _AppInputFieldState state) {
  // Todo: Extract currency conversion logic
  return Row(
    children: [
      Expanded(
        child: TextField(
          controller: state.widget.controller,
          focusNode: state.widget.focusNode,
          style: AppTextStyles.b14(
            state.widget.isDisabled ? AppTheme.colors(context).textDisabled : AppTheme.colors(context).text,
          ),
          keyboardType: TextInputType.number,
          textInputAction: state.widget.textInputAction,
          onSubmitted: (text) {
            state.autoCompleteOnSubmit();
            if (state.widget.onSubmit != null) {
              state.widget.onSubmit!(text);
            }
          },
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(13),
          ],
          onChanged: (text) {
            if (text.isEmpty) {
              state.widget.onChanged!(text);
              return;
            }
            String numericText = text.replaceAll('-', '');
            String formattedText = numericText;
            if (numericText.length > 5) {
              formattedText = '${numericText.substring(0, 5)}-${numericText.substring(5)}';
            }
            if (numericText.length > 12) {
              formattedText =
              '${numericText.substring(0, 5)}-${numericText.substring(5, 12)}-${numericText.substring(12)}';
            }
            int baseOffset = state.widget.controller.selection.baseOffset;
            state.widget.controller.text = formattedText;

            int newOffset = baseOffset + (formattedText.split('-').length - numericText.split('-').length);
            state.widget.controller.selection = TextSelection.collapsed(offset: newOffset.clamp(0, formattedText.length));

            if (state.widget.onChanged != null) {
              state.widget.onChanged!(formattedText);
            }
          },
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
    ],
  );
}
