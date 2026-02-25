import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class TransferDetailsPage extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String fromPrice;

  const TransferDetailsPage({
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
                          Iconsax.car,
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
                    _sectionTitle('Arrival Transfer'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Experience a seamless arrival with Doha Pride Tourism. '
                      'Our dedicated Meet & Greet representative will welcome you at the airport, '
                      'assist with luggage, and escort you to your private standard sedan. '
                      'With a professional chauffeur ensuring a smooth and comfortable journey, '
                      'we guarantee a hassle-free transfer to your destination.',
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
                      'Doha (Hotel/Residence)',
                    ),
                    _infoRow(Iconsax.clock, 'Estimated duration', '35 mins'),
                    _infoRow(Iconsax.category, 'Category', 'Standard'),

                    SizedBox(height: AppSpacing.lg),

                    _chipsRow(
                      label: 'Highlights',
                      items: const [
                        'Meet & Greet at the airport',
                        'Private sedan',
                        'Luggage assistance',
                      ],
                    ),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle("What's included"),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Inclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Personalized Meet & Greet service by our dedicated airport representative',
                      'Private transfer in a well-maintained standard sedan (maximum 3 passengers)',
                      'Assistance with luggage handling',
                      'Professional, English-speaking driver',
                      'Complimentary waiting time (60 minutes)',
                      '24/7 customer support',
                    ]),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Exclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Additional stops or detours not included in the booking',
                      'Gratuities (optional)',
                      'Extra luggage beyond standard allowance',
                    ]),

                    SizedBox(height: AppSpacing.xl),

                    _sectionTitle('Departure Transfer'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Ensure a stress-free departure with Doha Pride Tourism’s Standard Sedan transfer service. '
                      'Our professional chauffeur will pick you up from your hotel or residence and drive you to your departure terminal. '
                      'Enjoy a comfortable and timely ride in a private sedan, with assistance from our dedicated team to ensure a smooth journey to the airport.',
                    ),
                    SizedBox(height: AppSpacing.sm),
                    _infoRow(
                      Iconsax.location,
                      'Pickup',
                      'Doha (Hotel/Residence)',
                    ),
                    _infoRow(
                      Iconsax.location_tick,
                      'Drop-off',
                      'Hamad International Airport',
                    ),
                    _infoRow(Iconsax.clock, 'Estimated duration', '35 mins'),
                    _infoRow(Iconsax.category, 'Category', 'Standard'),

                    SizedBox(height: AppSpacing.lg),

                    _chipsRow(
                      label: 'Highlights',
                      items: const [
                        'Hotel pickup',
                        'Timely airport drop-off',
                        'Private sedan comfort',
                      ],
                    ),

                    SizedBox(height: AppSpacing.lg),

                    _sectionTitle("What's included"),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Inclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Professional, English-speaking driver',
                      'Private transfer in a well-maintained standard sedan (maximum 3 passengers)',
                      'Assistance with luggage handling',
                      '24/7 customer support',
                    ]),
                    SizedBox(height: AppSpacing.sm),
                    _subSectionTitle('Exclusions'),
                    SizedBox(height: AppSpacing.xs),
                    _bulletList(const [
                      'Additional stops or detours not included in the booking',
                      'Gratuities (optional)',
                    ]),

                    SizedBox(height: AppSpacing.xl),

                    _sectionTitle('Selected Transfer'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody(
                      'Arrival Transfer: Standard\n'
                      'Departure Transfer: Standard',
                    ),

                    SizedBox(height: AppSpacing.sm),

                    _sectionTitle('Transfer Mode'),
                    SizedBox(height: AppSpacing.xs),
                    _sectionBody('Arrival + Departure'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // bottom booking bar
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
                    /* TODO: open booking flow */
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(
                      0,
                      38.h,
                    ), // 👈 override global infinite width
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
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 6.h,
                  ),
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
}
