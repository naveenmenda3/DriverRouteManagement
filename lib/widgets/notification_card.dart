import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import '../constants/app_colors.dart';

class NotificationCard extends StatelessWidget {
  final String imageAsset;
  final String bookingId;
  final String customerName;
  final String serviceType; // e.g., DRY CLEANING
  final String address; // e.g., "\"Area Name, City\""
  final String timeRange; // e.g., "10:00 AM –12:00 PM"
  final String badgeLabel; // Pickup / Delivery
  final Color badgeColor; // kept for compatibility but gradient overrides color for Pickup; red used for Delivery shadow contrast

  const NotificationCard({
    super.key,
    required this.imageAsset,
    required this.bookingId,
    required this.customerName,
    required this.serviceType,
    required this.address,
    required this.timeRange,
    required this.badgeLabel,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE6EDF6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Main row content
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imageAsset,
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 2),
                    Text(
                      '$bookingId – $customerName',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      serviceType,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pickup Address → $address',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: 32), // spacing to avoid overlapping the badge
                  ],
                ),
              ),
            ],
          ),

          // Time-range chip at top-right
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFF0F3F7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                timeRange,
                style: GoogleFonts.inter(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textGray,
                ),
              ),
            ),
          ),

          // Gradient badge button at bottom-right with exact constraints
          Positioned(
            bottom: 0,
            right: 0,
            child: _GradientBadge(label: badgeLabel),
          ),
        ],
      ),
    );
  }
}

class _GradientBadge extends StatelessWidget {
  final String label;
  const _GradientBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    final bool isDelivery = label.toLowerCase() == 'delivery';
    final gradient = isDelivery
        ? null
        : LinearGradient(
            colors: const [Color(0xFF1F7CF4), Color(0xFF084DA6)],
            transform: GradientRotation(97.22 * math.pi / 180),
          );

    return Container(
      width: 90,
      height: 26,
      padding: const EdgeInsets.fromLTRB(12.22, 2.44, 12.22, 2.44),
      decoration: BoxDecoration(
        color: isDelivery ? const Color(0xFFE53935) : null,
        gradient: gradient,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
