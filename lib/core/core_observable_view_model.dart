import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/mixins/core_view_model_base_mixin.dart';
import 'package:stacked/stacked.dart';

abstract class CoreObservableViewModel extends ReactiveViewModel
    with WidgetsBindingObserver, CoreViewModelBase {
  @override
  initialize() async {
    WidgetsBinding.instance.addObserver(this);
    super.initialize();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
