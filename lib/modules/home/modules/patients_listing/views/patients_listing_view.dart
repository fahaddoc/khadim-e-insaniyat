import 'package:flutter/cupertino.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patients_listing/view_model/patients_listing_view_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/app_table_view/app_table_view.dart';

class PatientsListingView extends CoreView<PatientsListingViewModel> {
  const PatientsListingView({super.key});

  @override
  Widget buildView(BuildContext context, PatientsListingViewModel viewModel,
      Widget? child) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // AppButton.primary(
              //   size: AppButtonSize.small,
              //   label: 'Add Patient Entry',
              //   onTap: viewModel.onTapAddMedicine,
              // ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          AppTableView(
            tableHead: viewModel.tableHead,
            tableRow: viewModel.tableRow,
            onTapEdit: viewModel.onTapEditMedicine,
            onTapDelete: viewModel.onTapDeleteMedicine,
          ),
        ],
      ),
    );
  }

  @override
  PatientsListingViewModel viewModelBuilder(BuildContext context) {
    return PatientsListingViewModel();
  }
}
