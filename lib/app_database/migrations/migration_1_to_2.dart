import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/enums/enums.dart';

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('ALTER TABLE MedicinesListingModel ADD COLUMN type `${MedicineType.diabetic}`');
});