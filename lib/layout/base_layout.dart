import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const BaseLayout({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 600;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600 &&
      MediaQuery.of(context).size.width < 1024;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1024;

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      if (isDesktop(context)) {
        return desktop;
      } else if (isTablet(context)) {
        return tablet;
      } else {
        return mobile;
      }
    } else {
      if (isDesktop(context)) {
        return desktop;
      } else if (isTablet(context)) {
        return tablet;
      } else {
        return mobile;
      }
    }
  }
}
