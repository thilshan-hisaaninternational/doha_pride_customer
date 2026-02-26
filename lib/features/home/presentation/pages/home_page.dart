import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_appbar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_banner_carousel.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_drawer.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_featured_service_section.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_need_help.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_search_bar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_section_header.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_feature_tours_package_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Used to control the Scaffold so we can open the drawer from the custom app bar.
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      // Custom drawer shared across home flow.
      drawer: const HomeDrawer(),
      body: SafeArea(
        bottom: false,
        // Using CustomScrollView + slivers to mix pinned header and scrollable content.
        child: CustomScrollView(
          slivers: [
            // Pinned app bar with custom HomeAppBar inside.
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.background,
              elevation: 0,
              // Matches visual height of HomeAppBar.
              toolbarHeight: 60.h,
              automaticallyImplyLeading: false,
              flexibleSpace: SafeArea(
                bottom: false,
                child: HomeAppBar(
                  onMenuTap: () {
                    _scaffoldKey.currentState?.openDrawer();
                  },
                  onProfileTap: () {},
                  userName: 'Thilshan Mohamed',
                  greeting: 'Good Morning 👋',
                ),
              ),
            ),

            // ── Search Bar ───────────────────────────────────────
            SliverToBoxAdapter(child: HomeSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

            // Hero/banner carousel section.
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.screenPadding,
                ),
                child: HomeBannerCarousel(),
              ),
            ),

            // ── Section: Our Services ────────────────────────
            SliverToBoxAdapter(
              child: HomeSectionHeader(
                title: 'Our Services',
                // Navigates to full services tab when "See all" is tapped.
                onSeeAll: () {
                  context.go(AppRoutes.services);
                },
              ),
            ),

            // Horizontally scrolling featured services from mock data.
            SliverToBoxAdapter(child: const HomeFeaturedServiceSection()),

            // ── Section: Featured Tours & Packages ────────────────────────
            SliverToBoxAdapter(
              child: HomeSectionHeader(
                title: 'Featured Tours & Packages',
                onSeeAll: () {},
              ),
            ),

            // Horizontally scrolling transfers/tours carousel.
            SliverToBoxAdapter(child: const HomeFeaturedToursPackagesSection()),

            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

            // Support / help CTA at the bottom of the home feed.
            SliverToBoxAdapter(child: const HomeNeedHelp()),

            // Bottom padding so last section is not hidden behind bottom nav.
            SliverToBoxAdapter(
              child: SizedBox(height: AppSpacing.bottomPadding),
            ),
          ],
        ),
      ),
      // bottomNavigationBar is managed by HomeShell (StatefulShellRoute).
    );
  }
}
