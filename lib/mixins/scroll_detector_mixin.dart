import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/app/navigator/app_navigator.dart';
import 'package:khadim_e_insaniyat/core/core_observable_view_model.dart';

mixin ScrollDetector on CoreObservableViewModel {
  final scrollController = ScrollController();

  bool isScrollActive = false;

  _checkScrollPosition() {
    if (!scrollController.hasClients) {
      return;
    }
    if (scrollController.position.pixels < 0.1) {
      if (!isScrollActive) {
        return;
      }
      isScrollActive = false;
      notifyListeners();
      return;
    }
    if (isScrollActive) {
      return;
    }
    isScrollActive = true;
    notifyListeners();
  }

  @override
  initialize() async {
    scrollController.addListener(_checkScrollPosition);
    super.initialize();
  }

  @override
  void didChangeMetrics() {
    if (AppNavigator.currentContext == null) {
      return;
    }
    final value = MediaQuery.of(AppNavigator.currentContext!).viewInsets.bottom;
    if (value == 0) {
      _checkScrollPosition();
    }
    super.didChangeMetrics();
  }

  @override
  void dispose() {
    scrollController.removeListener(_checkScrollPosition);
    scrollController.dispose();
    super.dispose();
  }
}
