import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TransitToursDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String fromPrice;

  const TransitToursDetailsPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.fromPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: AppColors.background,
              elevation: 0,
              automaticallyImplyLeading: true,
              iconTheme: const IconThemeData(color: AppColors.textPrimary),
              expandedHeight: 220.h,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: AppColors.primary.withValues(alpha: 0.1),
                        child: Icon(
                          Iconsax.map_1,
                          size: 48.sp,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withValues(alpha: 0.7),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: AppSpacing.screenPadding,
                      right: AppSpacing.screenPadding,
                      bottom: AppSpacing.md,
                      child: Text(
                        title,
                        style: AppTextStyles.heading1.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  AppSpacing.screenPadding,
                  AppSpacing.md,
                  AppSpacing.screenPadding,
                  AppSpacing.xl + 60.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _sectionTitle('Transit tour overview'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Make the most of your layover in Doha with a curated transit tour. '
                      'Discover key landmarks, enjoy photo stops, and experience the city’s highlights '
                      'without worrying about timing back to the airport.',
                    ),
                    SizedBox(height: AppSpacing.sm),
                    _infoRow(
                      Iconsax.location,
                      'Pickup',
                      'Hamad International Airport',
                    ),
                    _infoRow(
                      Iconsax.location_tick,
                      'Drop-off',
                      'Hamad International Airport',
                    ),
                    _infoRow(Iconsax.clock, 'Available durations', '3–8 hours'),
                    _infoRow(
                      Iconsax.category,
                      'Tour type',
                      'Private or small group',
                    ),

                    SizedBox(height: AppSpacing.lg),

                    _chipsRow(
                      label: 'Highlights',
                      items: const [
                        'Airport pickup & drop-off',
                        'City & Corniche photo stops',
                        'Flexible transit-friendly timings',
                      ],
                    ),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle("What's included"),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Inclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Airport pickup and drop-off',
                      'English-speaking guide/driver',
                      'Air-conditioned vehicle',
                    ]),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Exclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Meals and drinks unless specified',
                      'Entrance tickets not mentioned',
                      'Tips and personal expenses',
                    ]),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle('Good to know'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Ensure your layover time is sufficient for the chosen tour duration, '
                      'including return to the airport and security checks.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Bottom booking bar
      bottomNavigationBar: Container(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.screenPadding,
          AppSpacing.sm,
          AppSpacing.screenPadding,
          AppSpacing.sm + MediaQuery.of(context).padding.bottom,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'From',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  Text(
                    fromPrice,
                    style: AppTextStyles.heading2.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: AppSpacing.sm),
            Expanded(
              child: SizedBox(
                height: 38.h,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: implement transit tours booking flow (similar to transfer)
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(0, 38.h),
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14.r),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text('Book now', style: AppTextStyles.buttonText),
                      SizedBox(width: 6.w),
                      const Icon(Iconsax.arrow_right_3, size: 18),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Shared helpers (mirroring transfer/tour details)

Widget _sectionTitle(String text) {
  return Text(text, style: AppTextStyles.heading3);
}

Widget _subSectionTitle(String text) {
  return Text(
    text,
    style: AppTextStyles.bodyMedium.copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.textPrimary,
    ),
  );
}

Widget _sectionBody(String text) {
  return Text(
    text,
    style: AppTextStyles.bodySmall.copyWith(
      color: AppColors.textSecondary,
      height: 1.5,
    ),
  );
}

Widget _infoRow(IconData icon, String label, String value) {
  return Padding(
    padding: EdgeInsets.only(top: 6.h),
    child: Row(
      children: [
        Icon(icon, size: 18.sp, color: AppColors.primary),
        SizedBox(width: 8.w),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: '$label: ',
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w600,
              ),
              children: [
                TextSpan(
                  text: value,
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _chipsRow({required String label, required List<String> items}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _sectionTitle(label),
      SizedBox(height: AppSpacing.xs),
      Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: items
            .map(
              (t) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: AppColors.divider.withValues(alpha: 0.8),
                  ),
                ),
                child: Text(
                  t,
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.textSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    ],
  );
}

Widget _bulletList(List<String> items) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: items
        .map(
          (t) => Padding(
            padding: EdgeInsets.only(bottom: 4.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '• ',
                  style: AppTextStyles.bodySmall.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),
                Expanded(
                  child: Text(
                    t,
                    style: AppTextStyles.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}
