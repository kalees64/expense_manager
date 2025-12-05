import 'package:expense_manager/common/widgets/responsive_layout.dart';
import 'package:expense_manager/screens/expenses_dashboard/expense_dashboard_desktop_screen.dart';
import 'package:expense_manager/screens/expenses_dashboard/expense_dashboard_mobile_screen.dart';
import 'package:expense_manager/screens/expenses_dashboard/expense_dashboard_tablet_screen.dart';
import 'package:flutter/material.dart';

class ExpenseDashboard extends StatelessWidget {
  const ExpenseDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileLayout: ExpenseDashboardMobileScreen(),
      tabletLayout: ExpenseDashboardTabletScreen(),
      desktopLayout: ExpenseDashboardDesktopScreen(),
    );
  }
}
