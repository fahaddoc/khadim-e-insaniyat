import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/helpers/helpers.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/models/patient_entry_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:toastification/toastification.dart';
import 'package:intl/intl.dart';

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
      _tableRow = [
        ...res.map((el) => MedicineListModel(
            name: el.item, qty: 0, type: el.type == null ? '' : ''))
      ];
      notifyListeners();
    } catch (e) {
      appToast(context!, e.toString(), '');
    }
  }

  fieldsValidation() {
    String result = '';
    if (patientNameController.text == '') {
      result += result != ''
          ? 'Patient Name is missing\n $result\n'
          : 'Patient Name is missing\n';
    }
    if (contactController.text == '') {
      result += result != ''
          ? 'Contact is missing\n $result\n'
          : 'Contact is missing\n';
    }
    if (ageController.text == '') {
      result +=
          result != '' ? 'Age is missing\n $result\n' : 'Age is missing\n';
    }
    if (addressController.text == '') {
      result += result != ''
          ? 'Address is missing\n $result\n'
          : 'Address is missing\n';
    }
    if (identityController.text == '') {
      result +=
          result != '' ? 'CNIC is missing\n $result\n' : 'CNIC is missing\n';
    }
    if (tableRow.isEmpty) {
      result += result != ''
          ? 'Medicines are missing\n $result\n'
          : 'Medicines are missing\n';
    }
    return result;
  }

  onTapAddEntry() async {
    String isValidate = fieldsValidation();
    if (isValidate != '') {
      appToast(context!, 'Fields Missing', fieldsValidation());
    }
    try {
      if (isValidate == '') {
        await database.patientEntryDao.insertPatientEntry(
          PatientEntryModel(
            name: patientNameController.text,
            age: int.parse(ageController.text),
            date: selectedDate,
            contact: contactController.text,
            identity: identityController.text,
            address: addressController.text,
            medicines: tableRow,
          ),
        );
        appToast(context!, 'Success', 'Entry Added Successfully',
            type: ToastificationType.success);
        notifyListeners();
      }
    } catch (e) {
      appToast(context!, 'Entry Errors', e.toString());
    }
  }

  String selectedDate = DateFormat('dd-MMMM-yyyy').format(DateTime.now());
  onChangeDate(value) {
    selectedDate = DateFormat('dd-MMMM-yyyy').format(value);
    notifyListeners();
  }

  @override
  Future<void> initialize() async {
    // final result = await database.patientEntryDao.findById("1");
    fetchMedicines();
    return super.initialize();
  }
}
