import 'package:flutter/material.dart';

/// Transit Tours–specific card for the service listing.
class TransitToursServiceCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final VoidCallback onTap;

  const TransitToursServiceCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TransitToursServiceCard(item: item, onTap: onTap);
  }
}
