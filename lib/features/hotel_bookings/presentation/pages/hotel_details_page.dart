import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class HotelDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String fromPrice;

  const HotelDetailsPage({
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
                          Iconsax.building_4,
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
                    _sectionTitle('Hotel overview'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Stay in comfort at a well-located property in Doha, offering modern rooms, '
                      'easy access to attractions, and welcoming service. Perfect for both leisure '
                      'and business stays.',
                    ),
                    SizedBox(height: AppSpacing.sm),
                    _infoRow(
                      Iconsax.location,
                      'Location',
                      'Doha Corniche or central city area',
                    ),
                    _infoRow(
                      Iconsax.star,
                      'Category',
                      '4–5 star property (varies by selection)',
                    ),
                    _infoRow(
                      Iconsax.user,
                      'Occupancy',
                      'Typically 2 guests per room',
                    ),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle('Room & amenities'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Modern, air-conditioned rooms',
                      'En-suite bathroom with toiletries',
                      'Complimentary Wi‑Fi',
                      'In-room safe and minibar (where available)',
                    ]),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle('Facilities'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'On-site restaurant or café',
                      'Fitness center or pool (varies by property)',
                      '24/7 front desk support',
                    ]),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle('Good to know'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Exact property, room type, and included services may vary by package. '
                      'Please review your booking confirmation for final details.',
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
                    // TODO: implement hotel booking flow
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

// Shared helpers

Widget _sectionTitle(String text) {
  return Text(text, style: AppTextStyles.heading3);
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
