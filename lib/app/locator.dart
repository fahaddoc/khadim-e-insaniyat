import 'package:khadim_e_insaniyat/services/overlay_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

final locator = StackedLocator.instance;

void setupLocator() {
  //locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => RouterService());
  locator.registerLazySingleton(() => OverlayService());

}

