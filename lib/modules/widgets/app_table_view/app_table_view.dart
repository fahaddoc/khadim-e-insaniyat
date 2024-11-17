import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/assets_gen/assets.gen.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_buttons/app_icon_button.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppTableView extends StatefulWidget {
  final List<String> tableHead;
  final List<dynamic> tableRow;
  final ValueChanged<dynamic>? onTapEdit;
  final ValueChanged<dynamic>? onTapDelete;
  final bool? hideActions;

  const AppTableView({
    super.key,
    required this.tableHead,
    required this.tableRow,
    this.onTapEdit,
    this.onTapDelete,
    this.hideActions = false,
  });

  @override
  State<StatefulWidget> createState() => _AppTableView();
}

class _AppTableView extends State<AppTableView> {
  late List<String> tableHead;
  late List<dynamic> tableRow;
  late ValueChanged<dynamic> onTapEdit;
  late ValueChanged<dynamic> onTapDelete;
  late bool? hideActions;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      children: [
        TableRow(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
          ),
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors(context).border,
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'S.No #',
                style: AppTextStyles.c12(
                  AppTheme.colors(context).text,
                ),
              ),
            ),
            ...widget.tableHead.map(
              (el) => Container(
                decoration: BoxDecoration(
                  color: AppTheme.colors(context).border,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                child: Text(
                  el,
                  style: AppTextStyles.c12(
                    AppTheme.colors(context).text,
                  ),
                ),
              ),
            ),
            if(!widget.hideActions!)
            Container(
              decoration: BoxDecoration(
                color: AppTheme.colors(context).border,
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                'Actions',
                style: AppTextStyles.c12(
                  AppTheme.colors(context).text,
                ),
              ),
            ),
          ],
        ),
        if (widget.tableRow.isNotEmpty)
          ...widget.tableRow.asMap().entries.map(
                (row) => TableRow(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Text(
                        '${row.key + 1}',
                        style: AppTextStyles.c12(
                          AppTheme.colors(context).text,
                        ),
                      ),
                    ),
                    ...row.value.toDynamicList.map(
                      (med) => Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        child: Text(
                          med.toString(),
                          style: AppTextStyles.c12(
                            AppTheme.colors(context).text,
                          ),
                        ),
                      ),
                    ),
                    if(!widget.hideActions!)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          AppIconButton(
                            icon: Assets.icons.edit,
                            iconWidth: 20,
                            iconHeight: 20,
                            iconColor: AppTheme.colors(context).primary,
                            onTap: () {
                              if (widget.onTapEdit != null) {
                                widget.onTapEdit!(row.value);
                              }
                            },
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          AppIconButton(
                            icon: Assets.icons.delete,
                            iconWidth: 20,
                            iconHeight: 20,
                            iconColor: AppTheme.colors(context).critical,
                            onTap: () {
                              if (widget.onTapDelete != null) {
                                widget.onTapDelete!(row.value);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ],
    );
  }
}
