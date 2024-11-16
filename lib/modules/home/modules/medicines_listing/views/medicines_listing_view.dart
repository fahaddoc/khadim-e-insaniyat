import 'package:flutter/cupertino.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/view_model/medicines_listing_view_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_table_view/app_table_view.dart';

class MedicinesListingView extends CoreView<MedicinesListingViewModel> {
  const MedicinesListingView({super.key});

  @override
  Widget buildView(BuildContext context, MedicinesListingViewModel viewModel,
      Widget? child) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          AppTableView(
            tableHead: viewModel.tableHead,
            tableRow: viewModel.tableRow,
          ),
        ],
      ),
    );
  }

  @override
  MedicinesListingViewModel viewModelBuilder(BuildContext context) {
    return MedicinesListingViewModel();
  }
}
