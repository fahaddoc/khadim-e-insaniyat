import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:flutter/material.dart';

class AppSwitchButton extends StatelessWidget {
  final bool value;
  final Function(bool)? onChanged;

  const AppSwitchButton({
    super.key,
    required this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onChanged != null) {
          onChanged!(!value);
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: 16,
        width: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: value
              ? AppTheme.colors(context).primary
              : AppTheme.colors(context).neutralHighlightActive,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 150),
              left: value ? 18 : 2,
              child: Container(
                height: 12,
                width: 12,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppTheme.colors(context).input,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 0),
                      blurRadius: 2,
                      color: Colors.black.withOpacity(0.2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
