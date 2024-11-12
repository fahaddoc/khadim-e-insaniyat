import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/app/locator.dart';
import 'package:stacked_services/stacked_services.dart';

class AppNavigator {
  static final _navigationService = locator<RouterService>();

  static final NavigationService navigationService = NavigationService();
  static BuildContext? get currentContext => _navigationService.router.navigatorKey.currentContext;
}