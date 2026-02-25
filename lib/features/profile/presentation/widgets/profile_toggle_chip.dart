import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileToggleChip extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const ProfileToggleChip({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  State<ProfileToggleChip> createState() => _ProfileToggleChipState();
}

class _ProfileToggleChipState extends State<ProfileToggleChip> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => _value = !_value);
        widget.onChanged(_value);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        width: 44.w,
        height: 24.h,
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: _value ? AppColors.primary : AppColors.divider,
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeInOut,
          alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 18.w,
            height: 18.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

