import 'package:floor/floor.dart';

abstract class DynamicListable {
  List<dynamic> get toDynamicList;
}

@entity
class MedicinesListingModel implements DynamicListable {
  @primaryKey
  final String id;
  final String companyName;
  final String item;
  final String invoice;
  final int quantities;
  final double sellingAmount;
  final double purchasingAmount;

  const MedicinesListingModel({
    required this.id,
    required this.companyName,
    required this.item,
    required this.invoice,
    required this.quantities,
    required this.sellingAmount,
    required this.purchasingAmount,
  });

  @override
  List<dynamic> get toDynamicList => [
    companyName,
    item,
    invoice,
    quantities,
    sellingAmount,
    purchasingAmount,
  ];
}
