import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_appbar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_need_help.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_package_card.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_search_bar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_section_header.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_see_all_arrow_card.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/homes_transfer_card.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/meet_and_greet_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // ── Mock Data ────────────────────────────────────────────────────

  final List<Map<String, dynamic>> _featuredPackages = [
    {
      'title': 'Transfer',
      'subtitle': 'Full Day Experience',
      'price': 'QAR 450',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80',
      'tag': 'Best Seller',
      'tagColor': 0xFFD4A843,
    },
    {
      'title': 'Tour',
      'subtitle': 'Half Day Tour',
      'price': 'QAR 280',
      'rating': '4.8',
      'image':
          'https://images.unsplash.com/photo-1501785888041-af3ef285b470?auto=format&fit=crop&w=800&q=80',
      'tag': 'Popular',
      'tagColor': 0xFF1A3C6E,
    },
    {
      'title': 'Transit Tour',
      'subtitle': 'Luxury Tour',
      'price': 'QAR 350',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1580674285054-bed31e145f59?w=400',
      'tag': 'New',
      'tagColor': 0xFF10B981,
    },
    {
      'title': 'Meet & Greet',
      'subtitle': 'Luxury Tour',
      'price': 'QAR 350',
      'rating': '4.7',
      'image':
          'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?auto=format&fit=crop&w=800&q=80',
      'tag': 'New',
      'tagColor': 0xFF10B981,
    },
    {
      'title': 'Transfer',
      'subtitle': 'Full Day Experience',
      'price': 'QAR 450',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80',
      'tag': 'Best Seller',
      'tagColor': 0xFFD4A843,
    },
    {
      'title': 'Transfer',
      'subtitle': 'Full Day Experience',
      'price': 'QAR 450',
      'rating': '4.9',
      'image':
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80',
      'tag': 'Best Seller',
      'tagColor': 0xFFD4A843,
    },
  ];

  final List<Map<String, dynamic>> _transfers = [
    {
      'title': 'Airport Transfer',
      'subtitle': 'Hamad Intl → City Center',
      'price': 'QAR 150',
      'vehicle': 'Sedan',
      'image':
          'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=400',
    },
    {
      'title': 'Luxury Transfer',
      'subtitle': 'Hamad Intl → The Pearl',
      'price': 'QAR 280',
      'vehicle': 'SUV',
      'image':
          'https://images.unsplash.com/photo-1571987502951-3fba0c0bed40?w=400',
    },
    {
      'title': 'Group Transfer',
      'subtitle': 'Airport → West Bay',
      'price': 'QAR 200',
      'vehicle': 'Van',
      'image':
          'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=400',
    },
        {
      'title': 'Airport Transfer',
      'subtitle': 'Hamad Intl → City Center',
      'price': 'QAR 150',
      'vehicle': 'Sedan',
      'image':
          'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?w=400',
    },
    {
      'title': 'Luxury Transfer',
      'subtitle': 'Hamad Intl → The Pearl',
      'price': 'QAR 280',
      'vehicle': 'SUV',
      'image':
          'https://images.unsplash.com/photo-1571987502951-3fba0c0bed40?w=400',
    },
    {
      'title': 'Group Transfer',
      'subtitle': 'Airport → West Bay',
      'price': 'QAR 200',
      'vehicle': 'Van',
      'image':
          'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?w=400',
    },
  ];

  final List<Map<String, dynamic>> _services = [
    {'icon': Iconsax.airplane, 'label': 'Meet &\nGreet', 'color': 0xFF1A3C6E},
    {'icon': Iconsax.car, 'label': 'Transfers', 'color': 0xFFD4A843},
    {'icon': Iconsax.map_1, 'label': 'Transit\nTours', 'color': 0xFF10B981},
    {'icon': Iconsax.category, 'label': 'Packages', 'color': 0xFFEF4444},
    {'icon': Iconsax.building_4, 'label': 'Hotels', 'color': 0xFF8B5CF6},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: _scaffoldKey,
      backgroundColor: AppColors.background,
      drawer: _buildDrawer(),
      // extendBody: true, //
      body: SafeArea(
        bottom: false,
        // top: true,
        child: CustomScrollView(
          slivers: [
            // ── App Bar ─────────────────────────────────────────
            // SliverToBoxAdapter(child: _buildAppBar()),
            SliverToBoxAdapter(
              child: HomeAppBar(
                onMenuTap: () {
                  // open drawer
                  _scaffoldKey.currentState?.openDrawer();
                },
                onProfileTap: () {
                  // navigate to profile
                },
                userName: 'Thilshan Mohamed',
                greeting: 'Good Morning 👋',
              ),
            ),

            // ── Search Bar ───────────────────────────────────────
            SliverToBoxAdapter(child: HomeSearchBar()),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

            SliverToBoxAdapter(child: MeetAndGreetCard(onBookTap: () {})),

            // ── Section: Our Services ────────────────────────
            SliverToBoxAdapter(
              child: HomeSectionHeader(title: 'Our Services', onSeeAll: () {}),
            ),

            SliverToBoxAdapter(child: _buildFeaturedPackages()),

            // ── Section: Featured Tours & Packages ────────────────────────
            SliverToBoxAdapter(
              child: HomeSectionHeader(
                title: 'Featured Tours & Packages',
                onSeeAll: () {},
              ),
            ),

            SliverToBoxAdapter(child: _buildTransfers()),

            // SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
            // SliverToBoxAdapter(child:  SeeAllArrowCard(onTap: () {

            // },)),
            SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

            // ── Section: Meet & Greet ─────────────────────────────
            // SliverToBoxAdapter(child: MeetAndGreetCard(onBookTap: () {})),
            SliverToBoxAdapter(child: HomeNeedHelp()),

            // bottom padding so content doesn't hide behind floating nav
            SliverToBoxAdapter(child: SizedBox(height: 110.h)),
          ],
        ),
      ),
      // bottomNavigationBar: _buildFloatingBottomNav(),
    );
  }

  // ── Featured Packages (horizontal scroll) ────────────────────────

  Widget _buildFeaturedPackages() {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: _featuredPackages.length > 5 ? 6 : _featuredPackages.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          // If more than 5 services and index == 5 → show arrow
          if (_featuredPackages.length > 5 && index == 5) {
            return SeeAllArrowCard(
              onTap: () {
                // navigate to full packages list
              },
            );
          }
          final item = _featuredPackages[index];
          return FeaturedPackageCard(item: item);
        },
      ),
    );
  }

  // ── Transfers (horizontal scroll) ────────────────────────────────

  Widget _buildTransfers() {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: _transfers.length > 5 ? 6 : _transfers.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          // If more than 5 services and index == 5 → show arrow
          if (_transfers.length > 5 && index == 5) {
            return SeeAllArrowCard(
              onTap: () {
                // navigate to full transfers list
              },
            );
          }
          final item = _transfers[index];
          return TransferCard(item: item);
        },
      ),
    );
  }
}
// ── Drawer ───────────────────────────────────────────────────────

Widget _buildDrawer() {
  return Drawer(
    backgroundColor: AppColors.surface,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(24.r),
        bottomRight: Radius.circular(24.r),
      ),
    ),
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(AppSpacing.lg),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.primary, AppColors.accent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60.w,
                  height: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.accent, width: 2),
                    gradient: LinearGradient(
                      colors: [AppColors.accent, AppColors.primary],
                    ),
                  ),
                  child: Icon(Iconsax.user, color: Colors.white, size: 28.sp),
                ),
                SizedBox(height: AppSpacing.sm),
                Text(
                  'Thilshan Mohamed',
                  style: AppTextStyles.heading3.copyWith(color: Colors.white),
                ),
                Text(
                  'thilshan@gmail.com',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSpacing.md),

          // Menu Items
          _drawerItem(Iconsax.home, 'Home', onTap: () {}),
          _drawerItem(Iconsax.ticket_2, 'My Bookings', onTap: () {}),
          _drawerItem(Iconsax.heart, 'Favourites', onTap: () {}),
          _drawerItem(Iconsax.notification, 'Notifications', onTap: () {}),
          _drawerItem(Iconsax.setting_2, 'Settings', onTap: () {}),
          _drawerItem(Iconsax.info_circle, 'About Us', onTap: () {}),

          const Spacer(),
          const Divider(),

          _drawerItem(
            Iconsax.logout,
            'Logout',
            color: AppColors.error,
            onTap: () {},
          ),
          SizedBox(height: AppSpacing.md),
        ],
      ),
    ),
  );
}

Widget _drawerItem(
  IconData icon,
  String label, {
  Color? color,
  VoidCallback? onTap,
}) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon, size: 22.sp, color: color ?? AppColors.textPrimary),
    title: Text(
      label,
      style: AppTextStyles.bodyLarge.copyWith(
        color: color ?? AppColors.textPrimary,
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: color == null
        ? Icon(
            Iconsax.arrow_right_3,
            size: 16.sp,
            color: AppColors.textSecondary,
          )
        : null,
  );
}
