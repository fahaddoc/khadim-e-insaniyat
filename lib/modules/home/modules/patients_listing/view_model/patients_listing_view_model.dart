import 'package:khadim_e_insaniyat/app/locator.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/helpers/helpers.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/models/patient_entry_model.dart';
import 'package:khadim_e_insaniyat/services/overlay_service.dart';

class PatientsListingViewModel extends CoreViewModel {
  final _overlayService = locator<OverlayService>();

  final List<String> tableHead = [
    'Patient Name',
    'Age',
    'Contact',
    'CNIC',
    'Address',
    'Medicine Quantities',
    'Date',
  ];

  late List<PatientEntryModel> _tableRow = [];

  List<PatientEntryModel> get tableRow => _tableRow;

  fetchMedicines() async {
    try {
      final res = await database.patientEntryDao.getAllPatientsEntry();
      _tableRow = res;
      notifyListeners();
    } catch (e) {
      appToast(context!, 'Error', e.toString());
    }
  }

  // to be refactor
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
