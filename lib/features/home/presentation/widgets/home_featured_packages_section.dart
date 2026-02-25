import 'package:doha_pride_customer/core/theme/app_spacing.dart';
import 'package:doha_pride_customer/features/home/data/datasources/home_mock_data.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_see_all_arrow_card.dart';
import 'package:doha_pride_customer/features/home/presentation/widgets/home_package_card.dart';
import 'package:doha_pride_customer/features/services/data/datasources/services_mock_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class HomeFeaturedPackagesSection extends StatelessWidget {
  const HomeFeaturedPackagesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.screenPadding),
        itemCount: homeServicesMock.length > 5 ? 6 : homeServicesMock.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          // If more than 5 services and index == 5 → show arrow
          if (homeServicesMock.length > 5 && index == 5) {
            return SeeAllArrowCard(
              onTap: () {
                // navigate to full services list
              },
            );
          }

          final item = homeServicesMock[index];

          return FeaturedServicesCard(
            item: item,
            onTap: () {
              final homeTitle = item['title'] as String;

              // Map home titles -> services titles
              String servicesTitle;
              switch (homeTitle) {
                case 'Transfer':
                  servicesTitle = 'Transfers';
                  break;
                case 'Tour':
                  servicesTitle = 'Tours';
                  break;
                case 'Transit Tour':
                  servicesTitle = 'Transit Tours';
                  break;
                case 'Meet & Greet':
                  servicesTitle = 'Meet & Greet';
                  break;
                case 'Hotel':
                  servicesTitle = 'Hotels';
                  break;
                default:
                  servicesTitle = homeTitle;
              }

              final items = getServiceItems(servicesTitle);

              context.goNamed(
                'service-listing',
                extra: {'title': servicesTitle, 'items': items},
              );
            },
          );
        },
      ),
    );
  }
}
