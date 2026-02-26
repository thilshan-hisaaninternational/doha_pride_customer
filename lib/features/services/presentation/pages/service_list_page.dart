import 'package:doha_pride_customer/core/theme/app_colors.dart';
import 'package:doha_pride_customer/features/hotel_bookings/presentation/widgets/hotels_service_card.dart';
import 'package:doha_pride_customer/features/meet_greet/presentation/widgets/meet_greet_service_card.dart';
import 'package:doha_pride_customer/features/services/domain/service_type.dart';
import 'package:doha_pride_customer/features/tours/presentation/widgets/tours_service_card.dart';
import 'package:doha_pride_customer/features/transfers/presentation/widgets/transfer_service_card.dart';
import 'package:doha_pride_customer/features/transit_tours/presentation/widgets/transit_tours_service_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ServiceListingPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> items;
  final ServiceType serviceType;

  const ServiceListingPage({
    super.key,
    required this.title,
    required this.items,
    required this.serviceType,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: Text(title), centerTitle: true),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 120.h),
        itemCount: items.length,
        separatorBuilder: (_, __) => SizedBox(height: 16.h),
        itemBuilder: (context, index) {
          final item = items[index];

          return _buildCardForType(
            serviceType,
            item,
            () => _handleTap(context, item),
          );
        },
      ),
    );
  }

  /// Choose which card widget to render based on [serviceType].
  Widget _buildCardForType(
    ServiceType type,
    Map<String, dynamic> item,
    VoidCallback onTap,
  ) {
    switch (type) {
      case ServiceType.transfers:
        return TransferServiceCard(item: item, onTap: onTap);
      case ServiceType.tours:
        return ToursServiceCard(item: item, onTap: onTap);
      case ServiceType.transitTours:
        return TransitToursServiceCard(item: item, onTap: onTap);
      case ServiceType.meetGreet:
        return MeetGreetServiceCard(item: item, onTap: onTap);
      case ServiceType.hotels:
        return HotelsServiceCard(item: item, onTap: onTap);
    }
  }

  /// Central place to decide where to navigate on tap.
  void _handleTap(BuildContext context, Map<String, dynamic> item) {
    switch (serviceType) {
      case ServiceType.transfers:
        // Go to transfer details route.
        context.pushNamed(
          'transfer-details',
          extra: {
            'title': item['title'] as String,
            'imageUrl': item['image'] as String,
            'fromPrice': item['price'] as String,
          },
        );
        break;

      case ServiceType.tours:
        // TODO: add proper Tours details route when ready.
        break;

      case ServiceType.transitTours:
        // TODO: add Transit Tours details route when ready.
        break;

      case ServiceType.meetGreet:
        // TODO: add Meet & Greet details route when ready.
        break;

      case ServiceType.hotels:
        // TODO: add Hotels details route when ready.
        break;
    }
  }
}
