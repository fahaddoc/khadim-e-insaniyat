import 'package:json_annotation/json_annotation.dart';

enum MedicineType{
  @JsonValue('DIABETIC')
  diabetic,
  @JsonValue('SKIN')
  skin,
}