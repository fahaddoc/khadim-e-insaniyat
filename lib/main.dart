import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:khadim_e_insaniyat/app_database/initialize_db/initialize_db.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:toastification/toastification.dart';

import 'app/locator.dart';
import 'app/navigator/app.router.dart';

var path = '/my/db/path';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDatabase();

  if (kIsWeb) {
    // Set the database factory for web
    databaseFactory = databaseFactoryFfiWeb;
    path = 'my_web_web.db';
  }
  GestureBinding.instance.resamplingEnabled = true;
  setupLocator();
  await initialiseServices();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  runApp(const MyApp());
}

initialiseServices() async {

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Khadim-E-Insaniyat',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      builder: (context, child) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: true),
        child: ToastificationWrapper(
          child: child!,
        ),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

class _MaterialScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => kIsWeb ? const ClampingScrollPhysics() : const BouncingScrollPhysics();

  @override
  Set<PointerDeviceKind> get dragDevices =>
      {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown};
}

