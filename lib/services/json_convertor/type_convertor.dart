import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';

class MedicineListConverter extends TypeConverter<List<MedicineListModel>, String> {
  @override
  List<MedicineListModel> decode(String databaseValue) {
    final List<dynamic> jsonList = jsonDecode(databaseValue);
    return jsonList.map((json) => MedicineListModel.fromJson(json)).toList();
  }

  @override
  String encode(List<MedicineListModel> value) {
    return jsonEncode(value);
  }
}
