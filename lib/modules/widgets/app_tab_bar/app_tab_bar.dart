import 'package:flutter/material.dart';
import 'package:khadim_e_insaniyat/modules/shared/app_text_styles.dart';
import 'package:khadim_e_insaniyat/shared/app_theme.dart';

class AppTabBar extends StatefulWidget {
  final TabController controller;
  final ValueChanged<int>? onChange;
  final List<String> tabs;
  final List<TabCounter> tabCounters;
  final bool isScrollable;
  final double horizontalMargin;
  final double horizontalPadding;
  final BuildContext? navigatorContext;
  final bool? showGuide;
  final List<(String title, String message)>? guidesTexts;

  const AppTabBar({
    super.key,
    required this.controller,
    required this.tabs,
    this.tabCounters = const [],
    this.isScrollable = true,
    this.horizontalMargin = 0,
    this.horizontalPadding = 0,
    this.onChange,
    this.showGuide = false,
    this.navigatorContext,
    this.guidesTexts = const [],
  });

  @override
  State<AppTabBar> createState() => _AppTabBarState();
}

class _AppTabBarState extends State<AppTabBar> {
  @override
  void initState() {
    widget.controller.addListener(_tabListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.removeListener(_tabListener);
    super.dispose();
  }

  _tabListener() {
    setState(() {});
  }

  int get currentTabIndex => widget.controller.index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: widget.horizontalMargin),
      child: TabBar(
        onTap: widget.onChange,
        controller: widget.controller,
        isScrollable: widget.isScrollable,
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        labelPadding: EdgeInsets.zero,
        // labelStyle: AppTextStyles.t14(AppTheme.colors(context).text),
        // labelColor: AppTheme.colors(context).text,
        // unselectedLabelStyle: AppTextStyles.b14(AppTheme.colors(context).textTersiary),
        // unselectedLabelColor: AppTheme.colors(context).textTersiary,
        indicatorColor: AppTheme.colors(context).primary,
        indicatorSize: TabBarIndicatorSize.label,
        dividerColor: AppTheme.colors(context).border,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            width: 2,
            color: AppTheme.colors(context).primaryActive,
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          // insets: EdgeInsets.only(right: viewModel.padding),
        ),
        splashBorderRadius: BorderRadius.circular(12),
        tabs: List.generate(
          widget.tabs.length,
              (index) => Container(
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                alignment: widget.isScrollable ? null : Alignment.center,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.tabs[index],
                      style: currentTabIndex == index
                          ? AppTextStyles.t14(AppTheme.colors(context).text)
                          : AppTextStyles.b14(
                          AppTheme.colors(context).textTersiary),
                    ),
                    if (widget.tabCounters
                        .where((element) => element.index == index)
                        .isNotEmpty) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: currentTabIndex == index
                              ? AppTheme.colors(context).primaryHighlightHover
                              : AppTheme.colors(context).neutralHighlight,
                        ),
                        child: Text(
                          widget.tabCounters
                              .where((element) => element.index == index)
                              .toList()[0]
                              .count
                              .toString(),
                          style: AppTextStyles.t14(
                            currentTabIndex == index
                                ? AppTheme.colors(context).text
                                : AppTheme.colors(context).textTersiary,
                          ),
                        ),
                      )
                    ],
                  ],
                ),
              ),
        ),

        tabAlignment: widget.isScrollable ? TabAlignment.start : null,
      ),
    );
  }
}

class TabCounter {
  final int index;
  final int count;

  TabCounter({
    required this.index,
    required this.count,
  });
}
