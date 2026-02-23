import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/core/theme/app_icon_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class SeeAllArrowCard extends StatelessWidget {
  final VoidCallback? onTap;

  const SeeAllArrowCard({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () {},
      child: Container(
       width: 56.w,  
        height: 56.w,
        decoration: BoxDecoration(
          shape: BoxShape.circle, 
          color: Colors.white,
          border: Border.all(
            color: Colors.grey.withOpacity(0.2),
          ),
            boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          Iconsax.arrow_right_3,
          size: AppIconSizes.lg,
          color: AppColors.primary,
        ),
      ),
    );
  }
}