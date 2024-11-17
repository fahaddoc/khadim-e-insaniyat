import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_buttons/app_button.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_dropdown_button/app_dropdown_button.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/modules/widgets/overlays/dialog/app_overlay_manager.dart';
import 'package:khadim_e_insaniyat/modules/widgets/overlays/medicines_overlay/add_medicine_overlay/view_model/add_medicine_overlay_view_model.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AddMedicineOverlayView extends CoreView<AddMedicineOverlayViewModel> {
  final MedicinesListingModel? details;

  const AddMedicineOverlayView({super.key, this.details});

  @override
  Widget buildView(BuildContext context, AddMedicineOverlayViewModel viewModel,
      Widget? child) {
    return AppOverlayManager(
      title: '${details != null ? 'Edit' : 'Add'} Medicine',
      borderRadius: 12,
      onClose: () => viewModel.onTapClose,
      verticalPadding: 12,
      horizontalPadding: 12,
      footer: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AppButton.outline(
            size: AppButtonSize.small,
            label: details != null ? 'Edit' : 'Add',
            onTap: viewModel.onTapAddMedicine,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppInputField.text(
                    controller: viewModel.companyNameController,
                    focusNode: viewModel.companyNameFocusNode,
                    label: 'Company Name',
                    hint: 'Enter company name',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppInputField.text(
                    controller: viewModel.medicineController,
                    focusNode: viewModel.medicineFocusNode,
                    label: 'Medicine Name',
                    hint: 'Enter medicine name',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppInputField.text(
                    controller: viewModel.invoiceController,
                    focusNode: viewModel.invoiceFocusNode,
                    label: 'Invoice Number',
                    hint: 'Enter invoice number',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppInputField.numeric(
                    controller: viewModel.quantitiesController,
                    focusNode: viewModel.quantitiesFocusNode,
                    label: 'Quantities',
                    hint: 'Enter quantities',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: AppInputField.numeric(
                    controller: viewModel.purchasingAmountController,
                    focusNode: viewModel.purchasingAmountFocusNode,
                    label: 'Purchasing Amount',
                    hint: 'Enter purchasing amount',
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: AppInputField.numeric(
                    controller: viewModel.sellingAmountController,
                    focusNode: viewModel.sellingAmountFocusNode,
                    label: 'Selling Amount',
                    hint: 'Enter selling amount',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Medicine Type',
                        style: AppTextStyles.b14(
                          AppTheme.colors(context).text,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8,),
                      SizedBox(
                        width: 200,
                        child: AppDropdownButton(
                          offset: const Offset(0, 45),
                          items: viewModel.medicineTypes,
                          itemBuilder: (e) => Row(
                            children: [
                              Text(
                                e.toString(),
                                style: AppTextStyles.b14(AppTheme.colors(context).text),
                              )
                            ],
                          ),
                          onItemSelect: (type) => viewModel.onSelectType(type),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: AppTheme.colors(context).ghost,
                                border: Border.all(
                                  width: 1,
                                  color: AppTheme.colors(context).border
                                )
                            ),
                            child: Text(
                              viewModel.medicineType.toString(),
                              style: AppTextStyles.c12(
                                AppTheme.colors(context).text,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  AddMedicineOverlayViewModel viewModelBuilder(BuildContext context) {
    return AddMedicineOverlayViewModel(details: details);
  }
}
