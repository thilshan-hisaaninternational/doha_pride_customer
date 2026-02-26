import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TransferPassengerDetailsPage extends StatefulWidget {
  final Map<String, dynamic> bookingData;

  const TransferPassengerDetailsPage({super.key, required this.bookingData});

  @override
  State<TransferPassengerDetailsPage> createState() =>
      _TransferPassengerDetailsPageState();
}

class _TransferPassengerDetailsPageState
    extends State<TransferPassengerDetailsPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _flightCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _flightCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _goNext() {
    if (!_formKey.currentState!.validate()) return;

    final combined = {
      ...widget.bookingData,
      'leadName': _nameCtrl.text.trim(),
      'phone': _phoneCtrl.text.trim(),
      'flightNumber': _flightCtrl.text.trim(),
      'notes': _notesCtrl.text.trim(),
    };

    context.pushNamed('transfer-booking-review', extra: combined);
  }

  @override
  Widget build(BuildContext context) {
    final title = widget.bookingData['title'] as String? ?? '';

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Passenger details'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTextStyles.heading3),
            SizedBox(height: AppSpacing.md),
            Text('Step 2 · Passenger details', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.md),

            Expanded(
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _nameCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Lead passenger name',
                      ),
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                    SizedBox(height: AppSpacing.md),
                    TextFormField(
                      controller: _phoneCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Phone number',
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (v) =>
                          (v == null || v.trim().isEmpty) ? 'Required' : null,
                    ),
                    SizedBox(height: AppSpacing.md),
                    TextFormField(
                      controller: _flightCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Flight number (optional)',
                      ),
                    ),
                    SizedBox(height: AppSpacing.md),
                    TextFormField(
                      controller: _notesCtrl,
                      decoration: const InputDecoration(
                        labelText: 'Special requests (optional)',
                      ),
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),

            // SizedBox(
            //   width: double.infinity,
            //   child: ElevatedButton(
            //     onPressed: _goNext,
            //     child: const Text('Next: Review'),
            //   ),
            // ),
            SizedBox(
              child: AppButton(text: 'Next: Review', onPressed: _goNext),
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
