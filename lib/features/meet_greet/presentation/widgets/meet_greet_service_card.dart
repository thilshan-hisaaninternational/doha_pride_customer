import 'package:doha_pride_customer/features/services/presentation/widgets/service_item_card.dart';
import 'package:flutter/material.dart';

/// Meet & Greet–specific card for the service listing.
class MeetGreetServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const MeetGreetServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ServiceItemCard(item: item, onTap: onTap);
  }
}
