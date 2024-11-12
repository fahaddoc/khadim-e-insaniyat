part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _booleanFieldContents(BuildContext context, _AppInputFieldState state) {
  return SizedBox.expand(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (state.widget.prefix != null) ...[
            state.widget.prefix!,
            const SizedBox(width: 8),
          ],
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 2),
              child: IgnorePointer(
                ignoring: state.widget.isDisabled,
                child: ExtendedTextField(
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
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    alignLabelWithHint: true,
                    border: InputBorder.none,
                    isCollapsed: true,
                    hintText: state.widget.hint,
                    hintStyle: AppTextStyles.b14(
                      AppTheme.colors(context).textTersiary,
                    ),
                  ),
                  specialTextSpanBuilder: BooleanTextSpanBuilder(context),
                ),
              ),
            ),
          ),
          if (state.suffix != null) ...[
            const SizedBox(width: 8),
            state.suffix!,
          ],
        ],
      ),
    ),
  );
}

class BooleanTextSpanBuilder extends SpecialTextSpanBuilder {
  BuildContext context;
  BooleanTextSpanBuilder(this.context);

  @override
  TextSpan build(String data, {TextStyle? textStyle, onTap}) {
    final defaultStyle = textStyle ?? const TextStyle();
    final boldStyle = AppTextStyles.t14(AppTheme.colors(context).text).copyWith(fontWeight: FontWeight.w600);

    final words = data.split(' ');
    final List<TextSpan> spans = [];

    for (var word in words) {
      if (['AND', 'OR', 'NOT'].contains(word)) {
        spans.add(TextSpan(text: word, style: boldStyle));
      } else {
        spans.add(TextSpan(text: word, style: defaultStyle));
      }
      spans.add(const TextSpan(text: ' ')); // Add space between words
    }
    spans.removeLast();

    return TextSpan(children: spans);
  }

  @override
  SpecialText? createSpecialText(String flag, {TextStyle? textStyle, SpecialTextGestureTapCallback? onTap, required int index}) {
    return null;
  }
}
