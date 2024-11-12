part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _currencyFieldContents(BuildContext context, _AppInputFieldState state) {
  // Todo: Extract currency conversion logic
  return Row(
    children: [
      Text(
        '\$',
        style: AppTextStyles.b14(AppTheme.colors(context).text),
      ),
      const SizedBox(width: 4),
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
            FilteringTextInputFormatter.allow(RegExp(r"^(.{0,15})")),
          ],
          onChanged: (text) {
            if (text.isEmpty) {
              state.widget.onChanged!(text);
              return;
            }
            int baseOffset = state.widget.controller.selection.baseOffset;
            if (RegExp(r"^[1-9]([0-9]{0,2})(,[0-9]{3})*$").hasMatch(text)) {
              state.widget.onChanged!(text);
              return;
            }
            String finalText = formatCurrency(text);

            if (state.widget.onChanged != null) {
              state.widget.onChanged!(finalText);
            }
            state.widget.controller.text = finalText;
            int newOffset = 0;
            for (String i in finalText.split('')) {
              if (baseOffset == 0) {
                break;
              }
              if (i == ',') {
                newOffset++;
              }
              if (i != ',') {
                newOffset++;
                baseOffset--;
              }
            }
            state.widget.controller.selection = TextSelection.collapsed(offset: newOffset);
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
