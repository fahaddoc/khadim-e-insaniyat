import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_responsive_builder.dart';
import 'package:khadim_e_insaniyat/modules/home/views/home_desktop_view.dart';
import 'package:khadim_e_insaniyat/modules/widgets/fields/app_input_field/app_input_field.dart';
import 'package:khadim_e_insaniyat/modules/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CoreResponsiveBuilder(
      mobile: HomeDesktopView(),
      desktop: HomeDesktopView(),
    );
  }

}