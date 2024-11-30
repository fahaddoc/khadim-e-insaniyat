// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medicine_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MedicineListModel _$MedicineListModelFromJson(Map<String, dynamic> json) =>
    MedicineListModel(
      name: json['name'] as String,
      qty: (json['qty'] as num?)?.toInt() ?? 0,
      type: json['type'] as String,
    );

Map<String, dynamic> _$MedicineListModelToJson(MedicineListModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'qty': instance.qty,
      'type': instance.type,
    };
