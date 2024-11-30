// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PatientEntryModel _$PatientEntryModelFromJson(Map<String, dynamic> json) =>
    PatientEntryModel(
      id: json['id'] as String?,
      name: json['name'] as String,
      age: (json['age'] as num).toInt(),
      date: json['date'] as String,
      contact: json['contact'] as String,
      identity: json['identity'] as String,
      address: json['address'] as String,
      medicines: (json['medicines'] as List<dynamic>)
          .map((e) => MedicineListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PatientEntryModelToJson(PatientEntryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'date': instance.date,
      'contact': instance.contact,
      'identity': instance.identity,
      'address': instance.address,
      'medicines': instance.medicines,
    };
