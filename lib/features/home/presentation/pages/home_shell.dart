import 'package:doha_pride_customer/features/home/presentation/widgets/app_bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const HomeShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    // We only want the bottom nav on the *root* screens
    // of each branch (home, services, bookings, profile),
    // not on any pushed detail pages.
    final uri = GoRouterState.of(context).uri;
    final isRootOfBranch = uri.pathSegments.length == 1;

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: isRootOfBranch
          ? AppBottomNav(
              currentIndex: navigationShell.currentIndex,
              onTap: (index) {
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            )
          : null,
    );
  }
}
