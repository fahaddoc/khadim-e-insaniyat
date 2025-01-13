import 'package:khadim_e_insaniyat/app/locator.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/helpers/helpers.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';
import 'package:khadim_e_insaniyat/services/overlay_service.dart';

class MedicinesListingViewModel extends CoreViewModel {
  final _overlayService = locator<OverlayService>();

  final List<String> tableHead = [
    'Company Name',
    'Invoice',
    'Item',
    'Quantities',
    'Type',
    'Purchasing Amount',
    'Selling Amount',
  ];

  late List<MedicinesListingModel> _tableRow = [];

  List<MedicinesListingModel> get tableRow => _tableRow;

  fetchMedicines() async {
    try {
      final res = await database.medicinesDao.getAllMedicines();
      _tableRow = res;
      notifyListeners();
    } catch (e) {
      appToast(context!, 'Error', e.toString());
    }
  }

  void onTapAddMedicine() async {
    final res = await _overlayService.showAddMedicineOverlay(context!);
    fetchMedicines();
    if (res == null) return;
  }

  void onTapEditMedicine(dynamic selectedRow) async {
    final res = await _overlayService.showEditMedicineOverlay(context!,
        details: selectedRow);
    fetchMedicines();
    if (res == null) return;
  }

  onTapDeleteMedicine(selectedRow) async {
    await database.medicinesDao.deleteMedicine(selectedRow);
    fetchMedicines();
  }

  @override
  Future<void> initialize() {
    fetchMedicines();
    return super.initialize();
  }
}
