import 'package:flutter/cupertino.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/helpers/helpers.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';

class AddMedicineOverlayViewModel extends CoreViewModel {
  TextEditingController companyNameController = TextEditingController();
  FocusNode companyNameFocusNode = FocusNode();

  TextEditingController invoiceController = TextEditingController();
  FocusNode invoiceFocusNode = FocusNode();

  TextEditingController medicineController = TextEditingController();
  FocusNode medicineFocusNode = FocusNode();

  TextEditingController quantitiesController = TextEditingController();
  FocusNode quantitiesFocusNode = FocusNode();

  TextEditingController purchasingAmountController = TextEditingController();
  FocusNode purchasingAmountFocusNode = FocusNode();

  TextEditingController sellingAmountController = TextEditingController();
  FocusNode sellingAmountFocusNode = FocusNode();

  String medicineType = 'DIABETIC';

  List<String> medicineTypes = ['DIABETIC','SKIN'];

  final MedicinesListingModel? details;

  AddMedicineOverlayViewModel({this.details});

  addMedicineData() async {
    final res = await database.medicinesDao.insertMedicine(
      MedicinesListingModel(
        item: medicineController.text,
        companyName: companyNameController.text,
        invoice: invoiceController.text,
        type: medicineType,
        quantities: int.parse(quantitiesController.text),
        sellingAmount: double.parse(sellingAmountController.text),
        purchasingAmount: double.parse(purchasingAmountController.text),
      ),
    );
    return res;
  }

  editSampleData() async {
    final res = await database.medicinesDao.insertMedicine(
      MedicinesListingModel(
        item: medicineController.text,
        companyName: companyNameController.text,
        invoice: invoiceController.text,
        type: medicineType,
        quantities: int.parse(quantitiesController.text),
        sellingAmount: double.parse(sellingAmountController.text),
        purchasingAmount: double.parse(purchasingAmountController.text),
      ),
    );
    return res;
  }

  editMedicineData() async {
    if(details == null) return;
    final res = await database.medicinesDao.updateMedicine(
      MedicinesListingModel(
        id: details!.id,
        item: medicineController.text,
        companyName: companyNameController.text,
        invoice: invoiceController.text,
        quantities: int.parse(quantitiesController.text),
        type: medicineType,
        sellingAmount: double.parse(sellingAmountController.text),
        purchasingAmount: double.parse(purchasingAmountController.text),
      ),
    );
    return res;
  }

  fieldsValidation() {
    String result = '';
    if (companyNameController.text == '') {
      result += result != ''
          ? 'Company Name is missing\n $result\n'
          : 'Company Name is missing\n';
    }
    if (medicineController.text == '') {
      result += result != ''
          ? 'Medicine Name is missing\n $result\n'
          : 'Medicine Name is missing\n';
    }
    if (quantitiesController.text == '') {
      result += result != ''
          ? 'Quantities is missing\n $result\n'
          : 'Quantities is missing\n';
    }
    if (invoiceController.text == '') {
      result += result != ''
          ? 'Invoice Number is missing\n $result\n'
          : 'Invoice Number is missing\n';
    }
    if (purchasingAmountController.text == '') {
      result += result != ''
          ? 'Purchasing is missing\n $result\n'
          : 'Purchasing is missing\n';
    }
    if (sellingAmountController.text == '') {
      result += result != ''
          ? 'Selling is missing\n $result\n'
          : 'Selling is missing\n';
    }
    return result;
  }

  void onTapAddMedicine() {
    String isValidate = fieldsValidation();
    if (isValidate != '') {
      appToast(context!, 'Fields Missing', fieldsValidation());
    }
    try {
      if (isValidate == '') {
        if(details != null){
          Navigator.of(context!).pop(editMedicineData());
        }else{
          Navigator.of(context!).pop(addMedicineData());
        }
          notifyListeners();
      }
    } catch (e) {
      Navigator.of(context!).pop(e);
    }
  }

  void onTapClose() {
    Navigator.of(context!).pop();
  }

  onSelectType(String value){
    medicineType = value;
    notifyListeners();
  }

  @override
  Future<void> initialize() {
    if(details != null){
      companyNameController.text = details!.companyName;
      quantitiesController.text = details!.quantities.toString();
      purchasingAmountController.text = details!.purchasingAmount.toString();
      sellingAmountController.text = details!.sellingAmount.toString();
      invoiceController.text = details!.invoice.toString();
      medicineController.text = details!.item;
      medicineType = details!.type!;
    }
    return super.initialize();
  }
}
