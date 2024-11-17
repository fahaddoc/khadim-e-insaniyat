import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/enums/enums.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/view_model/repository/medicines_listing_dao.dart';

part 'app_database.g.dart';

@Database(version: 2, entities: [MedicinesListingModel])
abstract class AppDatabase extends FloorDatabase {
  MedicinesDao get medicinesDao;
}