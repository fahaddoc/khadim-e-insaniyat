import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/app/locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:universal_html/html.dart';

class AppNavigator {
  static final _navigationService = locator<RouterService>();

  static BuildContext? get currentContext =>
      _navigationService.router.navigatorKey.currentContext;
  static String get currentPath => _navigationService.router.currentPath;

  static RootStackRouter get router => _navigationService.router;
  static String? get previousRoute => _navigationService.stack.length > 1
      ? _navigationService
          .stack[_navigationService.stack.length - 2].routeData.path
      : null;

  static Future<dynamic>? navigateTo<T>(
    PageRouteInfo route, {
    void Function(NavigationFailure)? onFailure,
  }) =>
      _navigationService.navigateTo(
        route,
        onFailure: onFailure,
      );

  static Future<dynamic>? navigateToPath<T>(
    String path, {
    void Function(NavigationFailure)? onFailure,
  }) =>
      _navigationService.navigateToPath(
        path: path,
        onFailure: onFailure,
      );

  static Future<T?>? replaceWith<T>(
    PageRouteInfo route, {
    void Function(NavigationFailure)? onFailure,
  }) =>
      _navigationService.replaceWith<T>(
        route,
        onFailure: onFailure,
      );

  static Future<dynamic>? clearStackAndShow(
    PageRouteInfo route, {
    void Function(NavigationFailure)? onFailure,
  }) {
    if (kIsWeb) {
      return _navigationService.replaceWith(
        route,
        onFailure: onFailure,
      );
    }
    return _navigationService.clearStackAndShow(
      route,
      onFailure: onFailure,
    );
  }

  static void popUntil(
    PageRouteInfo route,
  ) =>
      _navigationService.router.popUntil(
        ModalRoute.withName(route.path),
      );

  static Future<bool> pop({
    dynamic result,
  }) {
    return _navigationService.pop(result);
  }

  static popWeb() {
    if (kIsWeb) {
      window.history.go(-1);
      return;
    }
    pop();
  }
}
