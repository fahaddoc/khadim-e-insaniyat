import 'package:flutter/src/widgets/framework.dart';
import 'package:khadim_e_insaniyat/mixins/core_view_model_base_mixin.dart';
import 'package:stacked/stacked.dart';

abstract class CoreView<T extends CoreViewModelBase> extends StackedView<T> {
  const CoreView({super.key});

  // Build
  Widget buildView(BuildContext context, T viewModel, Widget? child);

  @override
  Widget builder(BuildContext context, T viewModel, Widget? child) {
    viewModel.setViewModelContext(context);
    return buildView(context, viewModel, child);
  }

  // Initialize
  @override
  void onViewModelReady(T viewModel) {
      viewModel.initialize();
    super.onViewModelReady(viewModel);
  }
}
