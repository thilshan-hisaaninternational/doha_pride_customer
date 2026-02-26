// services_page.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_secondary_appbar.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/notification_bell.dart';
import 'package:doha_pride_customer/features/services/data/datasources/services_mock_data.dart';
import 'package:doha_pride_customer/features/services/domain/service_type.dart';
import 'package:doha_pride_customer/features/services/presentation/widgets/services_wide_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:doha_pride_customer/features/services/data/datasources/services_mock_data.dart';
import 'package:doha_pride_customer/features/services/domain/service_type.dart';

class ServicesTab extends StatefulWidget {
  const ServicesTab({super.key});

  @override
  State<ServicesTab> createState() => _ServicesTabState();
}

class _ServicesTabState extends State<ServicesTab> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _services = servicesTabMock;
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

                          // onTap: () {
                          // final service = _filtered[index];

                          // context.pushNamed(
                          //   'service-listing',
                          //   extra: {
                          //     'title': service['title'],
                          //     'items': getServiceItems(service['title']),
                          //   },
                          // );

                          // },
                          // onTap: () {
                          //   final service = _filtered[index];
                          //   final title = service['title'] as String;

                          //   context.pushNamed(
                          //     'service-listing',
                          //     extra: {
                          //       'serviceType': serviceTypeFromTitle(title),
                          //       'title': title,
                          //       'items': getServiceItems(title),
                          //     },
                          //   );
                          // },
                          onTap: () {
                            final service = _filtered[index];
                            final title = service['title'] as String;

                            context.pushNamed(
                              'service-listing',
                              extra: {
                                'serviceType': serviceTypeFromTitle(title),
                                'title': title,
                                'items': getServiceItems(title),
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
