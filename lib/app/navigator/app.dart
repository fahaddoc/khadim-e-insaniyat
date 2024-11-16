import 'package:stacked/stacked_annotations.dart';

import '../../modules/home/views/home_view.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView, initial: true),
  ],
)
class AppSetup {}