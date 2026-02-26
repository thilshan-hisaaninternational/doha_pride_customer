import 'package:doha_pride_customer/core/router/app_router.dart';
import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TransferReviewPage extends StatelessWidget {
  final Map<String, dynamic> bookingData;

  const TransferReviewPage({super.key, required this.bookingData});

  @override
  Widget build(BuildContext context) {
    final title = bookingData['title'] as String? ?? '';
    final fromPrice = bookingData['fromPrice'] as String? ?? '';
    final date = bookingData['date'] as String? ?? '';
    final pickupTime = bookingData['pickupTime'] as String? ?? '';
    final passengers = bookingData['passengers']?.toString() ?? '';
    final vehicleType = bookingData['vehicleType'] as String? ?? '';
    final leadName = bookingData['leadName'] as String? ?? '';
    final phone = bookingData['phone'] as String? ?? '';
    final flight = bookingData['flightNumber'] as String? ?? '';
    final notes = bookingData['notes'] as String? ?? '';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Review booking'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.heading3),
            SizedBox(height: AppSpacing.sm),
            Text('Step 3 · Review & confirm', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.lg),

            Text('Trip details', style: AppTextStyles.heading4),
            SizedBox(height: AppSpacing.xs),
            Text('Date: $date', style: AppTextStyles.bodySmall),
            Text('Pickup time: $pickupTime', style: AppTextStyles.bodySmall),
            Text('Passengers: $passengers', style: AppTextStyles.bodySmall),
            Text('Vehicle: $vehicleType', style: AppTextStyles.bodySmall),

            SizedBox(height: AppSpacing.md),
            Text('Passenger', style: AppTextStyles.heading4),
            SizedBox(height: AppSpacing.xs),
            Text('Name: $leadName', style: AppTextStyles.bodySmall),
            Text('Phone: $phone', style: AppTextStyles.bodySmall),
            if (flight.isNotEmpty)
              Text('Flight: $flight', style: AppTextStyles.bodySmall),
            if (notes.isNotEmpty) ...[
              SizedBox(height: AppSpacing.xs),
              Text('Notes:', style: AppTextStyles.bodySmall),
              Text(notes, style: AppTextStyles.bodySmall),
            ],

            SizedBox(height: AppSpacing.lg),
            Text('Price summary', style: AppTextStyles.heading4),
            SizedBox(height: AppSpacing.xs),
            Text('Total: $fromPrice', style: AppTextStyles.bodySmall),

            const Spacer(),
            SizedBox(
              child: AppButton(
                text: 'Proceed to payment',
                onPressed: () => context.go(AppRoutes.home),
              ),
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
