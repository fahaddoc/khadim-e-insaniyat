
import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/models/patient_entry_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/patient_entry/view_model/repository/patient_entry_dao.dart';
import 'package:khadim_e_insaniyat/services/json_convertor/type_convertor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/view_model/repository/medicines_listing_dao.dart';

part 'app_database.g.dart';

@Database(version: 3, entities: [MedicinesListingModel,PatientEntryModel])
@TypeConverters([MedicineListConverter])
abstract class AppDatabase extends FloorDatabase {
  MedicinesDao get medicinesDao;
  PatientEntryDao get patientEntryDao;
}