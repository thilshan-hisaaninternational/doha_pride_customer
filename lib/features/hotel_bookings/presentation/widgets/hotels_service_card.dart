import 'package:doha_pride_customer/features/transfers/presentation/widgets/transfer_service_card.dart';
import 'package:flutter/material.dart';

/// Hotels-specific card for the service listing.
class HotelsServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const HotelsServiceCard({super.key, required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return HotelsServiceCard(item: item, onTap: onTap);
  }
}
