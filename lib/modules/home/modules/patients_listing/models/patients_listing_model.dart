import 'package:floor/floor.dart';
import 'package:uuid/uuid.dart';

abstract class DynamicListable {
  List<dynamic> get toDynamicList;
}

final uuid = Uuid();

@entity
class PatientsListingModel implements DynamicListable {
  @primaryKey
  final String id;
  final String companyName;
  final String item;
  final String invoice;
  final int quantities;
  final String? type;
  final double sellingAmount;
  final double purchasingAmount;

  PatientsListingModel({
    String? id,
    required this.companyName,
    required this.item,
    required this.invoice,
    required this.quantities,
    required this.sellingAmount,
    required this.purchasingAmount,
    this.type,
  }) : id = id ?? uuid.v4();

  @override
  List<dynamic> get toDynamicList => [
    companyName,
    item,
    invoice,
    quantities,
    type,
    sellingAmount,
    purchasingAmount,
  ];
}
