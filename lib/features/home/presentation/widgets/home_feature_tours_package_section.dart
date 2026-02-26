import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/features/home/data/datasources/home_mock_data.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_see_all_arrow_card.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_featured_tours_packages_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeFeaturedToursPackagesSection extends StatelessWidget {
  const HomeFeaturedToursPackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: featuredToursAndPackagesMock.length > 5
            ? 6
            : featuredToursAndPackagesMock.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          if (featuredToursAndPackagesMock.length > 5 && index == 5) {
            return SeeAllArrowCard(
              onTap: () {
                // navigate to full transfers list
              },
            );
          }

          final item = featuredToursAndPackagesMock[index];
          return HomeFeaturedToursPackagesCard(item: item);
        },
      ),
    );
  }
}
