import 'package:flutter/cupertino.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/enums/enums.dart';
import 'package:khadim_e_insaniyat/modules/home/models/medicine_list_model.dart';

class MedicineListViewModel extends CoreViewModel{
  final List<TextEditingController> qtyControllers = [];
  final List<FocusNode> qtyFocusNodes = [];



  final List<MedicineListModel> _medicineList = [
    MedicineListModel(
      name: 'TAB ELILIP 50/500 MG',
      qty: 0,
      type: MedicineType.diabetic,
    ),
    MedicineListModel(
      name: 'TAB Unipride 4 MG',
      qty: 0,
      type: MedicineType.diabetic,
    ),
    MedicineListModel(
      name: 'TAB Glocophage 500 MG',
      qty: 0,
      type: MedicineType.diabetic,
    ),
    MedicineListModel(
      name: 'TAB AMLOTAC 10 MG',
      qty: 0,
      type: MedicineType.diabetic,
    ),
  ];
  List<MedicineListModel> get medicineList => _medicineList;


  void updateQuantities() {
    for (int i = 0; i < medicineList.length; i++) {
      int quantity = int.tryParse(qtyControllers[i].text) ?? 0;
      // medicineList[i].qty = quantity; // Update model quantity
    }
  }


  onChangeQty(value){
    print(value);
  }

  @override
  Future<void> initialize() {
    for (int i = 0; i < medicineList.length; i++) {
      qtyControllers.add(TextEditingController(text: medicineList[i].name));
      qtyFocusNodes.add(FocusNode());
    }
    return super.initialize();
  }



}