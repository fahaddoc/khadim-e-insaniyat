import 'package:khadim_e_insaniyat/enums/enums.dart';

abstract class DynamicListable{
  List<dynamic> get toDynamicList;
}

class MedicineListModel implements DynamicListable{
  final String name;
  final int? qty;
  final String type;

  MedicineListModel({
    required this.name,
    this.qty,
    required this.type,
  });

  @override
  List<dynamic> get toDynamicList => [
    name,
    qty
  ];

}
