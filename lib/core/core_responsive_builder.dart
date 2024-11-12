import 'package:khadim_e_insaniyat/shared/utils.dart' as helper;
import 'package:flutter/material.dart';

class CoreDeviceType {
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  CoreDeviceType._({
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
  });

  static CoreDeviceType of(BuildContext context) {
    double screenWidth = helper.screenWidth(context);
    return CoreDeviceType._(
      isMobile: screenWidth <= 500,
      isTablet: screenWidth > 500 && screenWidth < 1200,
      isDesktop: screenWidth >= 1200,
    );
  }
}

class CoreResponsiveBuilder extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const CoreResponsiveBuilder({
    super.key,
    this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    Widget returnable = const SizedBox.shrink();

    if (CoreDeviceType.of(context).isMobile) {
      returnable = mobile ?? tablet ?? desktop ?? const SizedBox.shrink();
    }
    if (CoreDeviceType.of(context).isTablet) {
      returnable = tablet ?? desktop ?? mobile ?? const SizedBox.shrink();
    }
    if (CoreDeviceType.of(context).isDesktop) {
      returnable = desktop ?? tablet ?? mobile ?? const SizedBox.shrink();
    }
    return returnable;
  }
}
