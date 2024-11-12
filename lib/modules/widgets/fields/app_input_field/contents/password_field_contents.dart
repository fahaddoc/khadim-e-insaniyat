part of 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

Widget _passwordFieldContents(BuildContext context, _AppInputFieldState state) {
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
            obscureText: state.hidePassword,
            textInputAction: state.widget.textInputAction,
            onSubmitted: (text) {
              state.autoCompleteOnSubmit();
              if (state.widget.onSubmit != null) {
                state.widget.onSubmit!(text);
              }
            },
            onChanged: state.widget.onChanged,
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
      GestureDetector(
        onTap: () {
          state.hidePassword = !state.hidePassword;
          state.updateField();
        },
        child: Container(
          height: 36,
          width: 36,
          color: Colors.transparent,
          alignment: Alignment.center,
          child: AssetGenImage(
            state.hidePassword ? Assets.icons.eyeOpen.path : Assets.icons.eyeClose.path,
          ).image(
            width: 20,
            height: 20,
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
