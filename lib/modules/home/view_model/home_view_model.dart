import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';

class HomeViewModel extends CoreViewModel {

  TabController tabController;

  List<String> tabs = ['Patient Entry','Medicines List','Patient List'];

  HomeViewModel({
    required this.tabController,
  });

  void onChangeTab(int value, {bool forced = false}) {
    tabController.index = value;
    // switch (value) {
    //   case 0:
    //   case 1:
    //   case 2:
    // }
    // notifyListeners();
  }
}
