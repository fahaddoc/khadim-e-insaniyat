import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/widgets/navigation_bar/app_navigation_bar.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class HomeView extends StatelessWidget{
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors(context).surface,
      body: const Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppNavigationBar(),
            ],
          )
        ],
      ),
    );
  }

}