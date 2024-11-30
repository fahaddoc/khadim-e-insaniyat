import 'package:json_annotation/json_annotation.dart';

part 'medicine_list_model.g.dart';

abstract class DynamicListable{
  List<dynamic> get toDynamicList;
}

@JsonSerializable()
class MedicineListModel implements DynamicListable{
  final String name;
  int? qty;
  final String type;

  MedicineListModel({
    required this.name,
    this.qty = 0,
    required this.type,
  });


  @override
  List<dynamic> get toDynamicList => [
    name,
    qty,
    type
  ];

  factory MedicineListModel.fromJson(Map<String, dynamic> json) =>
      _$MedicineListModelFromJson(json);

  Map<String, dynamic> toJson() => _$MedicineListModelToJson(this);

}
