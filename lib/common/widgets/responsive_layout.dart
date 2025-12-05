import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
    required this.desktopLayout,
  });

  final Widget mobileLayout;
  final Widget tabletLayout;
  final Widget desktopLayout;

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;

    if (w < 770) {
      return mobileLayout;
    } else if (w < 1200) {
      return tabletLayout;
    } else {
      return desktopLayout;
    }
  }
}
