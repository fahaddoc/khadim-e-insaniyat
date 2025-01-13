import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/home/modules/medicines_listing/models/medicines_listing_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/overlays/medicines_overlay/add_medicine_overlay/views/add_medicine_overlay_view.dart';

mixin BaseOverlays{
  Future<dynamic> showAddMedicineOverlay(BuildContext context) async {
    return await showDialog(
      barrierColor: Colors.black.withOpacity(0.10),
      context: context,
      builder: (context)=> const AddMedicineOverlayView(),);
  }

  Future<dynamic> showEditMedicineOverlay(BuildContext context,{
    required MedicinesListingModel details
  }) async {
    return await showDialog(
      barrierColor: Colors.black.withOpacity(0.10),
      context: context,
      builder: (context)=> AddMedicineOverlayView(details:details),);
  }
}