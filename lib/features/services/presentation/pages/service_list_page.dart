import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/features/services/presentation/widgets/service_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ServiceListingPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;

  const ServiceListingPage({
    super.key,
    required this.title,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 120.h),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final item = items[index];

          return ServiceItemCard(
            item: item,
            onTap: () {
              // TODO: Navigate to detail page
            },
          );
        },
      ),
    );
  }
}