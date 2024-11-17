import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';
import 'package:khadim_e_insaniyat/modules/home/widgets/medicine_list/view_model/medicine_view_model.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class MedicineList extends CoreView<MedicineListViewModel> {
  final List<MedicineListModel> medicines;

  const MedicineList({
    super.key,
    required this.medicines,
  });

  @override
  Widget buildView(
      BuildContext context, MedicineListViewModel viewModel, Widget? child) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppTheme.colors(context).border,
                  ),
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(8))),
              child: Text(
                'SR #',
                style: AppTextStyles.t13(
                  AppTheme.colors(context).textTersiary,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: AppTheme.colors(context).border,
                  ),
                ),
                child: Center(
                  child: Text(
                    'Given Medicine',
                    style: AppTextStyles.t13(
                      AppTheme.colors(context).textTersiary,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: AppTheme.colors(context).border,
                ),
              ),
              child: Text(
                'Qty',
                style: AppTextStyles.t13(
                  AppTheme.colors(context).textTersiary,
                ),
              ),
            ),
          ],
        ),
        ...viewModel.medicineList.asMap().entries.map(
              (e) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: 42,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppTheme.colors(context).border,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${e.key + 1}',
                        style: AppTextStyles.t13(
                          AppTheme.colors(context).textTersiary,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: AppTheme.colors(context).border,
                        ),
                      ),
                      child: Text(
                        e.value.name,
                        style: AppTextStyles.t13(
                          AppTheme.colors(context).textTersiary,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1,
                        color: AppTheme.colors(context).border,
                      ),
                    ),
                    child: TextField(
                      controller: viewModel.qtyControllers[e.key],
                      focusNode: viewModel.qtyFocusNodes[e.key],
                      style: AppTextStyles.b14(
                        AppTheme.colors(context).text,
                      ),
                      onChanged: (value) => viewModel.onChangeQty(value),
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        // Allows only digits
                      ],
                      onEditingComplete: () {
                        // Optionally save all data at once
                        FocusScope.of(context).unfocus(); // Dismiss keyboard
                      },
                      maxLines: 1,
                      decoration: InputDecoration(
                        isCollapsed: true,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        hintStyle: AppTextStyles.b14(
                          AppTheme.colors(context).textTersiary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
      ],
    );
  }

  @override
  MedicineListViewModel viewModelBuilder(BuildContext context) {
    return MedicineListViewModel(medicines: medicines);
  }
}
