import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';

class MedicinesListingViewModel extends CoreViewModel {
  final List<String> tableHead = [
    'Company Name',
    'Invoice',
    'Item',
    'Quantities',
    'Purchasing Amount',
    'Selling Amount',
  ];

  late List<MedicinesListingModel> _tableRow = [];

  List<MedicinesListingModel> get tableRow => _tableRow;

  fetchMedicines() async {
    try {
      final res = await database.medicinesDao.getAllMedicines();
      _tableRow = res;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void addSampleData() async {
    await database.medicinesDao.insertMedicine(
      const MedicinesListingModel(
        id: '2',
        item: 'Paracetamol 2',
        companyName: 'Pharma Inc',
        invoice: 'INV002',
        quantities: 100,
        sellingAmount: 15.0,
        purchasingAmount: 12.0,
      ),
    );
  }

  @override
  Future<void> initialize() {
    fetchMedicines();
    addSampleData();
    return super.initialize();
  }
}
