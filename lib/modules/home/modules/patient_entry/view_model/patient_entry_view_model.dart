import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

class PatientEntryViewModel extends CoreViewModel {
  late TextEditingController patientNameController = getTextEditingController();
  late FocusNode patientNameFocusNode = getFocusNode();

  late PhoneNumberController contactController = PhoneNumberController();
  late FocusNode contactFocusNode = getFocusNode();

  late TextEditingController ageController = getTextEditingController();
  late FocusNode ageFocusNode = getFocusNode();

  late TextEditingController addressController = getTextEditingController();
  late FocusNode addressFocusNode = getFocusNode();

  late TextEditingController identityController = getTextEditingController();
  late FocusNode identityFocusNode = getFocusNode();

  List<String> tableHead = [
    'Given Medicine',
    'Qty',
  ];

  List<MedicineListModel> _tableRow = [];
  List<MedicineListModel> get tableRow => _tableRow;

  fetchMedicines() async {
    try {
      final dynamic res = await database.medicinesDao.getAllMedicines();
      _tableRow = [...res.map((el)=> MedicineListModel(name: el.item,qty: 0,type: el.type == null ? '': ''))];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<void> initialize() {
    fetchMedicines();
    return super.initialize();
  }

  onChangeDate() {}
}
