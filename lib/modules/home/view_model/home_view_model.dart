import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';

class HomeViewModel extends CoreViewModel{
  late TextEditingController patientNameController = getTextEditingController();
  late FocusNode patientNameFocusNode = getFocusNode();
}