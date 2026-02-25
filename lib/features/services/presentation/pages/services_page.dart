// services_page.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_secondary_appbar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/notification_bell.dart';
import 'package:doha_pride_customer/features/services/data/datasources/services_mock_data.dart';
import 'package:doha_pride_customer/features/services/presentation/widgets/services_wide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
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
      'title': 'Transfers',
      'subtitle': 'Airport Pickup & Chauffeur Service',
      'icon': Iconsax.car,
      'image':
          'https://images.unsplash.com/photo-1556122071-e404eaedb77f?auto=format&fit=crop&w=800&q=80',
      'tag': 'Available 24/7',
      'tagColor': 0xFF10B981,
      'available': true,
    },
    {
      'title': 'Tours',
      'subtitle': 'Desert Safaris & City Experiences',
      'icon': Iconsax.category,
      'image':
          'https://images.unsplash.com/photo-1546412414-8035e1776c9a?auto=format&fit=crop&w=800&q=80',
      'tag': 'Best Value',
      'tagColor': 0xFFEF4444,
      'available': true,
    },
    {
      'title': 'Transit Tours',
      'subtitle': 'Layover City Tours in Doha',
      'icon': Iconsax.map_1,
      'image':
          'https://images.unsplash.com/photo-1578898887932-dce23a595ad4?auto=format&fit=crop&w=800&q=80',
      'tag': 'Layover Special',
      'tagColor': 0xFF1A3C6E,
      'available': true,
    },
    {
      'title': 'Meet & Greet',
      'subtitle': 'VIP Airport Assistance Service',
      'icon': Iconsax.airplane,
      'image':
          'https://images.unsplash.com/photo-1529070538774-1843cb3265df?auto=format&fit=crop&w=800&q=80',
      'tag': 'Most Popular',
      'tagColor': 0xFFD4A843,
      'available': true,
    },
    {
      'title': 'Hotels',
      'subtitle': 'Luxury & Boutique Stays in Qatar',
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
      return s['title'].toString().toLowerCase().contains(
        _searchQuery.toLowerCase(),
      );
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
            SectionAppBar(
              title: 'Our Services',
              subtitle: 'What can we help you with?',
              action: const NotificationBell(),
            ),

            // ── Search Bar ─────────────────────────────────────────
            // _buildSearchBar(),

            // SizedBox(height: AppSpacing.sm),

            // ── Results count ──────────────────────────────────────
            // Padding(
            //   padding: EdgeInsets.symmetric(
            //     horizontal: AppSpacing.screenPadding,
            //   ),
            //   child: Text(
            //     '${_filtered.length} Services Available',
            //     style: AppTextStyles.bodySmall.copyWith(
            //       color: AppColors.textSecondary,
            //     ),
            //   ),
            // ),

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
                            // print("Tapped on ${_filtered[index]['title']}");
                            final service = _filtered[index];

                            context.pushNamed(
                              'service-listing',
                              extra: {
                                'title': service['title'],
                                'items': getServiceItems(service['title']),
                              },
                            );
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
          Icon(Iconsax.search_normal, size: 64.sp, color: AppColors.textHint),
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
