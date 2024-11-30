import 'package:flutter/cupertino.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';

class MedicineListViewModel extends CoreViewModel {
  final List<MedicineListModel> medicines;
  final List<TextEditingController> qtyControllers = [];
  final List<FocusNode> qtyFocusNodes = [];

  MedicineListViewModel({
    required this.medicines,
  });

  // final List<MedicineListModel> _medicineList = [
  //   MedicineListModel(
  //     name: 'TAB ELILIP 50/500 MG',
  //     qty: 0,
  //     type: MedicineType.diabetic,
  //   ),
  //   MedicineListModel(
  //     name: 'TAB Unipride 4 MG',
  //     qty: 0,
  //     type: MedicineType.diabetic,
  //   ),
  //   MedicineListModel(
  //     name: 'TAB Glocophage 500 MG',
  //     qty: 0,
  //     type: MedicineType.diabetic,
  //   ),
  //   MedicineListModel(
  //     name: 'TAB AMLOTAC 10 MG',
  //     qty: 0,
  //     type: MedicineType.diabetic,
  //   ),
  // ];

  List<MedicineListModel> _medicineList = [];

  List<MedicineListModel> get medicineList => _medicineList;

  void updateQuantities() {
    for (int i = 0; i < _medicineList.length; i++) {
      int quantity = int.tryParse(qtyControllers[i].text) ?? 0;
      _medicineList[i].qty = quantity;
    }
  }

  onChangeQty(value) {
    updateQuantities();
    notifyListeners();
  }

  @override
  Future<void> initialize() {
    if (medicines.isNotEmpty) {
      _medicineList = medicines;
    }

    for (int i = 0; i < medicineList.length; i++) {
      qtyControllers.add(TextEditingController());
      qtyFocusNodes.add(FocusNode());
    }
    return super.initialize();
  }
}
