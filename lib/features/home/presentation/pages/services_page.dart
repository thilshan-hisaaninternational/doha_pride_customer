// services_page.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_search_bar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/services_wide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _services = [
    {
      'title': 'Meet & Greet',
      'description':
          'VIP airport welcome service. Our team meets you at the gate with a personalized sign and escorts you through the airport.',
      'price': 'From QAR 250',
      'duration': '1-2 Hours',
      'icon': Iconsax.airplane,
      'image':
          'https://images.unsplash.com/photo-1436491865332-7a61a109cc05?auto=format&fit=crop&w=800&q=80',
      'tag': 'Most Popular',
      'tagColor': 0xFFD4A843,
      'available': true,
    },
    {
      'title': 'Airport Transfers',
      'description':
          'Comfortable and reliable transfers from Hamad International Airport to your hotel or any destination in Qatar.',
      'price': 'From QAR 150',
      'duration': '30-60 Min',
      'icon': Iconsax.car,
      'image':
          'https://images.unsplash.com/photo-1449965408869-eaa3f722e40d?auto=format&fit=crop&w=800&q=80',
      'tag': 'Available 24/7',
      'tagColor': 0xFF10B981,
      'available': true,
    },
    {
      'title': 'Transit Tours',
      'description':
          'Make the most of your layover with our curated city tours. Explore Doha\'s highlights during your transit stop.',
      'price': 'From QAR 300',
      'duration': '3-6 Hours',
      'icon': Iconsax.map_1,
      'image':
          'https://images.unsplash.com/photo-1539650116574-75c0c6d73f6e?auto=format&fit=crop&w=800&q=80',
      'tag': 'Layover Special',
      'tagColor': 0xFF1A3C6E,
      'available': true,
    },
    {
      'title': 'Trip Packages',
      'description':
          'All-inclusive tour packages covering Qatar\'s top attractions. Desert safaris, cultural tours, and luxury experiences.',
      'price': 'From QAR 450',
      'duration': 'Full Day',
      'icon': Iconsax.category,
      'image':
          'https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=800&q=80',
      'tag': 'Best Value',
      'tagColor': 0xFFEF4444,
      'available': true,
    },
    {
      'title': 'Hotel Booking',
      'description':
          'Handpicked luxury and boutique hotels across Qatar. We partner with the finest properties to guarantee your comfort.',
      'price': 'From QAR 500',
      'duration': 'Per Night',
      'icon': Iconsax.building_4,
      'image':
          'https://images.unsplash.com/photo-1566073771259-6a8506099945?auto=format&fit=crop&w=800&q=80',
      'tag': 'Premium',
      'tagColor': 0xFF8B5CF6,
      'available': true,
    },
  ];

  List<Map<String, dynamic>> get _filtered {
    if (_searchQuery.isEmpty) return _services;
    return _services.where((s) {
      return s['title']
          .toString()
          .toLowerCase()
          .contains(_searchQuery.toLowerCase());
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── AppBar ─────────────────────────────────────────────
            _buildAppBar(),

            // ── Search Bar ─────────────────────────────────────────
            _buildSearchBar(),
            // HomeSearchBar(
            //   hintText: 'Search services...',
            //   onTap: () {
            //     // focus search input or navigate to dedicated search page
            //   },
            // ),
            SizedBox(height: AppSpacing.sm),

            // ── Results count ──────────────────────────────────────
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.screenPadding,
              ),
              child: Text(
                '${_filtered.length} Services Available',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ),

            SizedBox(height: AppSpacing.sm),

            // ── Service Cards (vertical scroll) ────────────────────
            Expanded(
              child: _filtered.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.screenPadding,
                        0,
                        AppSpacing.screenPadding,
                        120.h, // space above bottom nav
                      ),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 16.h),
                      itemBuilder: (context, index) {
                        return ServiceWideCard(
                          service: _filtered[index],
                          onTap: () {
                            // context.push(AppRoutes.serviceDetail, extra: service)
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ── AppBar ─────────────────────────────────────────────────────

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.screenPadding,
        AppSpacing.md,
        AppSpacing.screenPadding,
        AppSpacing.sm,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Our Services', style: AppTextStyles.heading1),
              Text(
                'What can we help you with?',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
          // notification bell
          Container(
            width: 42.w,
            height: 42.w,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Icon(
              Iconsax.notification,
              size: 20.sp,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Search Bar ────────────────────────────────────────────────

  Widget _buildSearchBar() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.screenPadding,
        vertical: AppSpacing.sm,
      ),
      child: Container(
        height: 52.h,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: TextField(
          controller: _searchController,
          onChanged: (value) => setState(() => _searchQuery = value),
          style: AppTextStyles.bodyMedium,
          decoration: InputDecoration(
            hintText: 'Search services...',
            hintStyle: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textHint,
            ),
            prefixIcon: Icon(
              Iconsax.search_normal,
              size: 20.sp,
              color: AppColors.textSecondary,
            ),
            suffixIcon: _searchQuery.isNotEmpty
                ? IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                    icon: Icon(
                      Iconsax.close_circle,
                      size: 18.sp,
                      color: AppColors.textSecondary,
                    ),
                  )
                : null,
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(vertical: 14.h),
          ),
        ),
      ),
    );
  }

  // ── Empty State ───────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Iconsax.search_normal,
            size: 64.sp,
            color: AppColors.textHint,
          ),
          SizedBox(height: AppSpacing.md),
          Text('No services found', style: AppTextStyles.heading3),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Try a different search term',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}