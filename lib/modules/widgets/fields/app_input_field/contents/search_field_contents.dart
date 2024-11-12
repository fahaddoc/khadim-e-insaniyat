part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _searchFieldContents(BuildContext context, _AppInputFieldState state) {
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
            cursorColor: AppTheme.colors(context).primary,
            controller: state.widget.controller,
            focusNode: state.widget.focusNode,
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
            onChanged: (text) {
              if (state.widget.onChanged != null) {
                state.widget.onChanged!(text);
              }
              state.updateField();
            },
            inputFormatters: [
              LengthLimitingTextInputFormatter(state.widget.maxLength),
            ],
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
      if (state.widget.controller.text.isNotEmpty)
        AppGestureDetector(
          cursor: SystemMouseCursors.click,
          onTap: () {
            state.widget.controller.text = '';
            if (state.widget.onChanged != null) {
              state.widget.onChanged!('');
            }
            if (state.widget.onClearSearch != null) {
              state.widget.onClearSearch!();
            }
          },
          builder: (context, isHovered) => Container(
            width: 36,
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Assets.icons.cross.image(
              width: 16,
              height: 16,
            ),
          ),
        ),
    ],
  );
}
