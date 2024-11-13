import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/view_model/home_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/widgets/medicine_list/views/medicine_list.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_date_picker/app_date_picker.dart';
import 'package:khadim_e_insaniyat/modules/widgets/current_opd/current_opd.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/modules/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class HomeDesktopView extends CoreView<HomeViewModel> {
  const HomeDesktopView({super.key});

  @override
  Widget buildView(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors(context).surface,
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppNavigationBar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CurrentOPD(
                        title: 'DIABETIC O.P.D',
                        tokenNumber: '01',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(24),
                        child: Container(
                          width: 1000,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: AppTheme.colors(context).neutralHighlight,
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                        ),
                      ),
                      const SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Container(
                          width: 1000,
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
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) {
    return HomeViewModel();
  }
}
