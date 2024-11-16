import 'package:khadim_e_insaniyat/enums/enums.dart';

class MedicineListModel {
  final String name;
  late final int qty;
  final MedicineType type;

  MedicineListModel({
    required this.name,
    required this.qty,
    required this.type,
  });
}
