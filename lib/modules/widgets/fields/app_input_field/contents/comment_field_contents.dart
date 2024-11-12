part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _commentFieldContents(BuildContext context, _AppInputFieldState state) {
  return Row(
    children: [
      if (state.widget.prefix != null) ...[
        state.widget.prefix!,
        const SizedBox(width: 8),
      ],
      Expanded(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 140),
          child: SingleChildScrollView(
            child: IgnorePointer(
              ignoring: state.widget.isDisabled,
              child: TextField(
                controller: state.widget.controller,
                focusNode: state.widget.focusNode,
                style: (CoreDeviceType.of(context).isDesktop ? AppTextStyles.b14 : AppTextStyles.c12)(
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
                maxLines: null,
                decoration: InputDecoration(
                  isCollapsed: true,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  alignLabelWithHint: true,
                  contentPadding: EdgeInsets.all(CoreDeviceType.of(context).isDesktop ? 4 : 0),
                  border: InputBorder.none,
                  hintText: state.widget.hint,
                  hintStyle: (CoreDeviceType.of(context).isDesktop ? AppTextStyles.b14 : AppTextStyles.c12)(
                    AppTheme.colors(context).textTersiary,
                  ),
                ),
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
