import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_view_model.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';

class HomeViewModel extends CoreViewModel {
  late TextEditingController patientNameController = getTextEditingController();
  late FocusNode patientNameFocusNode = getFocusNode();

  late PhoneNumberController contactController = PhoneNumberController();
  late FocusNode contactFocusNode = getFocusNode();

  late TextEditingController ageController = getTextEditingController();
  late FocusNode ageFocusNode = getFocusNode();

  late TextEditingController addressController = getTextEditingController();
  late FocusNode addressFocusNode = getFocusNode();

  late TextEditingController identityController = getTextEditingController();
  late FocusNode identityFocusNode = getFocusNode();

  onChangeDate() {}
}
