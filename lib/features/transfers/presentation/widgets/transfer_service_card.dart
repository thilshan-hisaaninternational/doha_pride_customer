import 'package:doha_pride_customer/features/services/presentation/widgets/service_item_card.dart';
import 'package:flutter/material.dart';

/// Transfer-specific card for the service listing.
/// Replace the layout here when you get the transfer design.
class TransferServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const TransferServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ServiceItemCard(item: item, onTap: onTap);
  }
}
