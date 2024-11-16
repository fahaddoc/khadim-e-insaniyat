
import 'package:floor/floor.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';

@dao
abstract class MedicinesDao{
  @Query('SELECT * FROM MedicinesListingModel')
  Future<List<MedicinesListingModel>> getAllMedicines();

  @insert
  Future<void> insertMedicine(MedicinesListingModel medicine);

  @delete
  Future<void> deleteMedicine(MedicinesListingModel medicine);
}