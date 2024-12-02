import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/core/core_responsive_builder.dart';
import 'package:khadim_e_insaniyat/core/core_view.dart';
import 'package:khadim_e_insaniyat/modules/home/view_model/home_view_model.dart';
import 'package:khadim_e_insaniyat/modules/home/views/home_desktop_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();

}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin{
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this,animationDuration: const Duration(milliseconds: 0));
  }

  @override
  Widget build(BuildContext context){
    return _HomeView(tabController:tabController);
  }

}

class _HomeView extends CoreView<HomeViewModel>{
  final TabController tabController;

  const _HomeView({
    required this.tabController,
  });

  @override
  Widget buildView(BuildContext context,HomeViewModel viewModel, Widget? child) {
    return const CoreResponsiveBuilder(
      mobile: HomeDesktopView(),
      desktop: HomeDesktopView(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context){
    return HomeViewModel(tabController: tabController);
  }
}



