import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view_model_widget.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/views/medicines_listing_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/views/patient_entry_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patients_listing/views/patients_listing_view.dart';
import 'package:khadim_e_insaniyat/modules/home/view_model/home_view_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_tab_bar/app_tab_bar.dart';
import 'package:khadim_e_insaniyat/modules/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class HomeDesktopView extends CoreViewModelWidget<HomeViewModel> {
  const HomeDesktopView({super.key});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors(context).surface,
      appBar: const AppNavigationBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24),
            child: AppTabBar(
              controller: viewModel.tabController,
              // onChange: viewModel.onChangeTab,
              tabs: viewModel.tabs.map((e) => e).toList(),
              navigatorContext: viewModel.navigatorContext!,
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: viewModel.tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                PatientEntryView(),
                MedicinesListingView(),
                PatientsListingView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
