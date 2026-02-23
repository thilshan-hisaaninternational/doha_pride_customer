// features/bookings/presentation/pages/bookings_tab.dart
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/bookings_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

// Tab filter options
enum BookingFilter { all, upcoming, completed, cancelled }

class BookingsTab extends StatefulWidget {
  const BookingsTab({super.key});

  @override
  State<BookingsTab> createState() => _BookingsTabState();
}

class _BookingsTabState extends State<BookingsTab> {
  BookingFilter _selectedFilter = BookingFilter.all;

  final List<Map<String, dynamic>> _bookings = [
    {
      'id': 'DP-001234',
      'service': 'Meet & Greet',
      'description': 'VIP Arrival Assistance',
      'date': '24 Feb 2026',
      'time': '10:30 AM',
      'price': 'QAR 250',
      'status': 'upcoming',
      'icon': Iconsax.airplane,
      'iconColor': 0xFF1A3C6E,
      'passengers': 2,
      'location': 'Hamad International Airport',
    },
    {
      'id': 'DP-001198',
      'service': 'Airport Transfer',
      'description': 'Hamad Intl → The Pearl Qatar',
      'date': '20 Feb 2026',
      'time': '02:00 PM',
      'price': 'QAR 200',
      'status': 'completed',
      'icon': Iconsax.car,
      'iconColor': 0xFFD4A843,
      'passengers': 3,
      'location': 'The Pearl Qatar',
    },
    {
      'id': 'DP-001145',
      'service': 'Desert Safari Package',
      'description': 'Full Day Experience',
      'date': '15 Feb 2026',
      'time': '08:00 AM',
      'price': 'QAR 450',
      'status': 'completed',
      'icon': Iconsax.category,
      'iconColor': 0xFFEF4444,
      'passengers': 4,
      'location': 'Inland Sea, Qatar',
    },
    {
      'id': 'DP-001089',
      'service': 'Transit Tour',
      'description': 'Doha City Highlights',
      'date': '10 Feb 2026',
      'time': '11:00 AM',
      'price': 'QAR 300',
      'status': 'cancelled',
      'icon': Iconsax.map_1,
      'iconColor': 0xFF10B981,
      'passengers': 1,
      'location': 'Doha City Center',
    },
    {
      'id': 'DP-001056',
      'service': 'Hotel Booking',
      'description': 'Mondrian Doha — 3 Nights',
      'date': '28 Feb 2026',
      'time': '03:00 PM',
      'price': 'QAR 1,800',
      'status': 'upcoming',
      'icon': Iconsax.building_4,
      'iconColor': 0xFF8B5CF6,
      'passengers': 2,
      'location': 'West Bay, Doha',
    },
  ];

  List<Map<String, dynamic>> get _filtered {
    if (_selectedFilter == BookingFilter.all) return _bookings;
    return _bookings
        .where((b) => b['status'] == _selectedFilter.name)
        .toList();
  }

  // summary counts for the stat cards
  int get _upcomingCount =>
      _bookings.where((b) => b['status'] == 'upcoming').length;
  int get _completedCount =>
      _bookings.where((b) => b['status'] == 'completed').length;
  int get _cancelledCount =>
      _bookings.where((b) => b['status'] == 'cancelled').length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // ── AppBar ───────────────────────────────────────────
            _buildAppBar(),

            // ── Stats Row ────────────────────────────────────────
            // _buildStatsRow(),

            SizedBox(height: AppSpacing.md),

            // ── Filter Tabs ──────────────────────────────────────
            _buildFilterTabs(),

            SizedBox(height: AppSpacing.sm),

            // ── Booking Cards ────────────────────────────────────
            Expanded(
              child: _filtered.isEmpty
                  ? _buildEmptyState()
                  : ListView.separated(
                      padding: EdgeInsets.fromLTRB(
                        AppSpacing.screenPadding,
                        AppSpacing.sm,
                        AppSpacing.screenPadding,
                        120.h,
                      ),
                      itemCount: _filtered.length,
                      separatorBuilder: (_, __) => SizedBox(height: 14.h),
                      itemBuilder: (context, index) {
                        return BookingCard(
                          booking: _filtered[index],
                          onTap: () {},
                          onCancel: _filtered[index]['status'] == 'upcoming'
                              ? () => _showCancelDialog(
                                    _filtered[index]['id'],
                                  )
                              : null,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ── AppBar ──────────────────────────────────────────────────────

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
              Text('My Bookings', style: AppTextStyles.heading1),
              Text(
                '${_bookings.length} total bookings',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Spacer(),
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

  // ── Stats Row ───────────────────────────────────────────────────

  Widget _buildStatsRow() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
      child: Row(
        children: [
          _StatCard(
            label: 'Upcoming',
            count: _upcomingCount,
            color: AppColors.primary,
            icon: Iconsax.clock,
          ),
          SizedBox(width: 10.w),
          _StatCard(
            label: 'Completed',
            count: _completedCount,
            color: AppColors.success,
            icon: Iconsax.tick_circle,
          ),
          SizedBox(width: 10.w),
          _StatCard(
            label: 'Cancelled',
            count: _cancelledCount,
            color: AppColors.error,
            icon: Iconsax.close_circle,
          ),
        ],
      ),
    );
  }

  // ── Filter Tabs ─────────────────────────────────────────────────

  Widget _buildFilterTabs() {
    return SizedBox(
      height: 40.h,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        children: BookingFilter.values.map((filter) {
          final isActive = _selectedFilter == filter;
          final label = filter.name[0].toUpperCase() + filter.name.substring(1);

          return GestureDetector(
            onTap: () => setState(() => _selectedFilter = filter),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : AppColors.surface,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: isActive
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 1),
                        ),
                      ],
              ),
              child: Center(
                child: Text(
                  label,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: isActive ? Colors.white : AppColors.textSecondary,
                    fontWeight:
                        isActive ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // ── Empty State ─────────────────────────────────────────────────

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Iconsax.ticket_2, size: 64.sp, color: AppColors.textHint),
          SizedBox(height: AppSpacing.md),
          Text('No bookings found', style: AppTextStyles.heading3),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Your ${_selectedFilter.name} bookings will appear here',
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }

  // ── Cancel Dialog ───────────────────────────────────────────────

  void _showCancelDialog(String bookingId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        title: Text('Cancel Booking', style: AppTextStyles.heading3),
        content: Text(
          'Are you sure you want to cancel booking $bookingId? This action cannot be undone.',
          style: AppTextStyles.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Keep Booking',
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              // trigger cancel use case later
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                'Cancel Booking',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Stat Card ─────────────────────────────────────────────────────────────────

class _StatCard extends StatelessWidget {
  final String label;
  final int count;
  final Color color;
  final IconData icon;

  const _StatCard({
    required this.label,
    required this.count,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(0.08),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: color.withOpacity(0.2)),
        ),
        child: Row(
          children: [
            Icon(icon, size: 18.sp, color: color),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$count',
                  style: AppTextStyles.heading3.copyWith(color: color),
                ),
                Text(
                  label,
                  style: AppTextStyles.caption.copyWith(
                    color: color.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}