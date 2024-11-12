import 'package:stacked/stacked_annotations.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../../modules/home/views/home_view.dart';
import '../../modules/patients_listing/patients_listing_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
    MaterialRoute(page: PatientsListingView),
  ],
)
class AppSetup {}