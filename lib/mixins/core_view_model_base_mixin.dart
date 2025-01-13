import 'dart:async';

import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

mixin CoreViewModelBase on ChangeNotifier {
  BuildContext? context;
  BuildContext? get navigatorContext => StackedService.navigatorKey?.currentContext;

  setViewModelContext(BuildContext context) {
    this.context = context;
  }

  Future<T?>? contextCall<T>(
    Future<T?>? Function(BuildContext context) call, {
    int retryCount = 25,
  }) async {
    while (retryCount > 0) {
      await Future.delayed(const Duration(milliseconds: 300));
      if (context?.mounted ?? false) {
        return await call(context!);
      }
      retryCount--;
    }
    return null;
  }

  final List<TextEditingController> _textEditingControllers = <TextEditingController>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];

  TextEditingController getTextEditingController({String? text}) {
    final controller = TextEditingController(text: text);
    _textEditingControllers.add(controller);
    return controller;
  }

  PhoneNumberController getPhoneNumberController({String? text}) {
    final controller = PhoneNumberController(text: text);
    _textEditingControllers.add(controller);
    return controller;
  }

  Future<void> initialize() async {}

  void _disposeTextEditingController(TextEditingController controller) {
    controller.dispose();
  }

  void _disposeFocusNode(FocusNode focusNode) {
    focusNode.dispose();
  }

  @override
  void dispose() {
    _textEditingControllers.forEach(_disposeTextEditingController);
    _focusNodes.forEach(_disposeFocusNode);
    super.dispose();
  }
}
