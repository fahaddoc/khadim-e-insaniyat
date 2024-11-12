part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _tagFieldContents<T extends Object>(BuildContext context, _AppInputFieldState<T> state) {
  return Row(
    children: [
      Expanded(
        child: IgnorePointer(
          ignoring: state.widget.isDisabled,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ...List.generate(
                state.widget.selectedTags!.length,
                (index) => SelectionTag(
                  label: state.widget.autoCompleteFieldOptions!.optionTranslator(state.widget.selectedTags![index]),
                  isSelected: true,
                  onCancel: () {
                    state.widget.onTagCancel!(state.widget.selectedTags![index]);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: IntrinsicWidth(
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
            ],
          ),
        ),
      ),
    ],
  );
}
