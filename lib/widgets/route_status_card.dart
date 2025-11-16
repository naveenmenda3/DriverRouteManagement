import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class RouteStatusCard extends StatelessWidget {
  final String routeId;
  final int deliveries;
  final int pickups;
  final int payments;
  final int backToBase;
  final int? selectedIndex; // 0: Delivery, 1: Pickups, 2: Payment, 3: Back to Base
  final VoidCallback? onDeliveryTap;
  final VoidCallback? onPickupsTap;
  final VoidCallback? onPaymentTap;
  final VoidCallback? onBackToBaseTap;

  const RouteStatusCard({
    super.key,
    required this.routeId,
    required this.deliveries,
    required this.pickups,
    required this.payments,
    required this.backToBase,
    this.selectedIndex,
    this.onDeliveryTap,
    this.onPickupsTap,
    this.onPaymentTap,
    this.onBackToBaseTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Route ID section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryBlue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  'Route Id',
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                Text(
                  routeId,
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 12),

          // Status items
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _StatusItem(
                  count: deliveries.toString().padLeft(2, '0'),
                  label: 'Delivery',
                  isHighlighted: selectedIndex == 0,
                  onTap: onDeliveryTap,
                ),
                _StatusItem(
                  count: pickups.toString().padLeft(2, '0'),
                  label: 'Pickups',
                  isHighlighted: selectedIndex == 1,
                  onTap: onPickupsTap,
                ),
                _StatusItem(
                  count: payments.toString().padLeft(2, '0'),
                  label: 'Payment',
                  isHighlighted: selectedIndex == 2,
                  onTap: onPaymentTap,
                ),
                _StatusItem(
                  count: backToBase.toString().padLeft(2, '0'),
                  label: 'Back to Base',
                  isHighlighted: selectedIndex == 3,
                  onTap: onBackToBaseTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusItem extends StatelessWidget {
  final String count;
  final String label;
  final bool isHighlighted;
  final VoidCallback? onTap;

  const _StatusItem({
    required this.count,
    required this.label,
    required this.isHighlighted,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: isHighlighted ? AppColors.primaryBlue : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Column(
          children: [
            Text(
              count,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: isHighlighted ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 9,
                fontWeight: FontWeight.w500,
                color: isHighlighted ? Colors.white : AppColors.textGray,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
