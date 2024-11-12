import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/view_model/home_view_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/modules/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class HomeDesktopView extends CoreView<HomeViewModel>{
  const HomeDesktopView({super.key});

  @override
  Widget buildView(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors(context).surface,
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppNavigationBar(),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppTheme.colors(context).neutralHighlight,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      AppInputField.text(
                        controller: viewModel.patientNameController,
                        focusNode: viewModel.patientNameFocusNode,
                        label: 'Patient Name',
                        hint: 'Enter name here',
                        horizontalMargin: 40,
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