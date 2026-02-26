import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:doha_pride_customer/features/auth/presentation/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TransferBookingOptionsPage extends StatefulWidget {
  final String title;
  final String imageUrl;
  final String fromPrice;

  const TransferBookingOptionsPage({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.fromPrice,
  });

  @override
  State<TransferBookingOptionsPage> createState() =>
      _TransferBookingOptionsPageState();
}

class _TransferBookingOptionsPageState
    extends State<TransferBookingOptionsPage> {
  DateTime? _selectedDate;
  TimeOfDay? _pickupTime;
  int _passengers = 1;
  String _vehicleType = 'Standard Sedan';

  Future<void> _pickDate() async {
    final today = DateTime.now();
    final result = await showDatePicker(
      context: context,
      firstDate: today,
      lastDate: today.add(const Duration(days: 365)),
      initialDate: _selectedDate ?? today,
    );
    if (result != null) {
      setState(() => _selectedDate = result);
    }
  }

  Future<void> _pickTime() async {
    final result = await showTimePicker(
      context: context,
      initialTime: _pickupTime ?? TimeOfDay.now(),
    );
    if (result != null) {
      setState(() => _pickupTime = result);
    }
  }

  void _goNext() {
    if (_selectedDate == null || _pickupTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select date and pickup time')),
      );
      return;
    }

    final bookingData = {
      'title': widget.title,
      'imageUrl': widget.imageUrl,
      'fromPrice': widget.fromPrice,
      'date': _selectedDate!.toIso8601String(),
      'pickupTime':
          '${_pickupTime!.hour.toString().padLeft(2, '0')}:${_pickupTime!.minute.toString().padLeft(2, '0')}',
      'passengers': _passengers,
      'vehicleType': _vehicleType,
    };

    context.pushNamed('transfer-booking-passenger', extra: bookingData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('Book transfer'), centerTitle: true),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Step 1 · Select options', style: AppTextStyles.heading3),
            SizedBox(height: AppSpacing.md),

            // Date
            Text('Travel date', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.xs),
            OutlinedButton(
              onPressed: _pickDate,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _selectedDate == null
                      ? 'Select date'
                      : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                ),
              ),
            ),
            SizedBox(height: AppSpacing.md),

            // Pickup time
            Text('Pickup time', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.xs),
            OutlinedButton(
              onPressed: _pickTime,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  _pickupTime == null
                      ? 'Select time'
                      : _pickupTime!.format(context),
                ),
              ),
            ),
            SizedBox(height: AppSpacing.md),

            // Passengers
            Text('Passengers', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.xs),
            Row(
              children: [
                IconButton(
                  onPressed: _passengers > 1
                      ? () => setState(() => _passengers--)
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text('$_passengers'),
                IconButton(
                  onPressed: () => setState(() => _passengers++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.md),

            // Vehicle type
            Text('Vehicle type', style: AppTextStyles.bodyMedium),
            SizedBox(height: AppSpacing.xs),
            DropdownButton<String>(
              value: _vehicleType,
              isExpanded: true,
              items: const [
                DropdownMenuItem(
                  value: 'Standard Sedan',
                  child: Text('Standard Sedan'),
                ),
                DropdownMenuItem(
                  value: 'Luxury Sedan',
                  child: Text('Luxury Sedan'),
                ),
                DropdownMenuItem(value: 'Van', child: Text('Van')),
              ],
              onChanged: (val) {
                if (val != null) {
                  setState(() => _vehicleType = val);
                }
              },
            ),

            const Spacer(),

            SizedBox(
              child: AppButton(
                text: 'Next: Passenger details',
                onPressed: _goNext,
              ),
            ),
            SizedBox(height: AppSpacing.lg),
          ],
        ),
      ),
    );
  }
}
