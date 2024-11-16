import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/core/core_view_model_widget.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/view_model/patient_entry_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/widgets/medicine_list/views/medicine_list.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_date_picker/app_date_picker.dart';
import 'package:khadim_e_insaniyat/modules/widgets/current_opd/current_opd.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class PatientEntryView extends CoreView<PatientEntryViewModel> {
  const PatientEntryView({super.key});

  @override
  Widget buildView(
      BuildContext context, PatientEntryViewModel viewModel, Widget? child) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.colors(context).neutralHighlight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        const CurrentOPD(
                          title: 'DIABETIC O.P.D',
                          tokenNumber: '01',
                        ),
                        const SizedBox(height: 12,),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AppInputField.text(
                                      controller: viewModel.patientNameController,
                                      focusNode: viewModel.patientNameFocusNode,
                                      label: 'Patient Name',
                                      hint: 'Enter name here',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: AppInputField.numeric(
                                      controller: viewModel.ageController,
                                      focusNode: viewModel.ageFocusNode,
                                      label: 'Age',
                                      hint: 'Enter age here',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: AppDatePicker(
                                      label: 'Date',
                                      onChange: viewModel.onChangeDate(),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AppInputField.phone(
                                      controller: viewModel.contactController,
                                      focusNode: viewModel.contactFocusNode,
                                      label: 'Contact',
                                      hint: 'Enter contact here',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: AppInputField.numeric(
                                      controller: viewModel.identityController,
                                      focusNode: viewModel.identityFocusNode,
                                      label: 'CNIC',
                                      hint: 'Enter cnic here',
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: AppInputField.description(
                                      controller: viewModel.addressController,
                                      focusNode: viewModel.addressFocusNode,
                                      label: 'Address',
                                      hint: 'Enter address here',
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.colors(context).neutralHighlight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const MedicineList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  PatientEntryViewModel viewModelBuilder(BuildContext context) {
    return PatientEntryViewModel();
  }
}
