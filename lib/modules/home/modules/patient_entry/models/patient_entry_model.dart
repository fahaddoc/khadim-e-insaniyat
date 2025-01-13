import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicine_list_model.dart';
import 'package:khadim_e_insaniyat/services/json_convertor/type_convertor.dart';
import 'package:uuid/uuid.dart';

part 'patient_entry_model.g.dart';

abstract class DynamicListable {
  List<dynamic> get toDynamicList;
}

const uuid = Uuid();

@JsonSerializable()
@entity
class PatientEntryModel implements DynamicListable {
  @primaryKey
  final String id;
  final String name;
  final int age;
  final String date;
  final String contact;
  final String identity;
  final String address;
  @TypeConverters([MedicineListConverter])
  final List<MedicineListModel> medicines;

  PatientEntryModel({
    String? id,
    required this.name,
    required this.age,
    required this.date,
    required this.contact,
    required this.identity,
    required this.address,
    required this.medicines,
  }) : id = id ?? uuid.v4();

  @override
  List<dynamic> get toDynamicList => [
        name,
        age,
        contact,
        identity,
        address,
        medicines,
        date,
      ];

  factory PatientEntryModel.fromJson(Map<String, dynamic> json) =>
      _$PatientEntryModelFromJson(json);

  Map<String, dynamic> toJson() => _$PatientEntryModelToJson(this);
}
