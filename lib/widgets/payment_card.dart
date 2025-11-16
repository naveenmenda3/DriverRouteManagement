import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class PaymentCard extends StatelessWidget {
  final String bookingId;
  final String customerName;
  final String serviceType;
  final String pickupAddress;
  final String timeInfo;
  final int quantity;
  final String paymentType;
  final String walletAmount;
  final String status;
  final Color statusColor;
  final String jobNumber;

  const PaymentCard({
    super.key,
    required this.bookingId,
    required this.customerName,
    required this.serviceType,
    required this.pickupAddress,
    required this.timeInfo,
    required this.quantity,
    required this.paymentType,
    required this.walletAmount,
    required this.status,
    required this.statusColor,
    required this.jobNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            children: [
              // Job number badge
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    jobNumber,
                    style: GoogleFonts.inter(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Booking details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$bookingId - $customerName',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      serviceType.toUpperCase(),
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Pickup Address • $pickupAddress',
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textGray,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      timeInfo,
                      style: GoogleFonts.inter(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: timeInfo.toLowerCase().contains('arrived just now')
                            ? const Color(0xFF0DA608)
                            : Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: AppColors.textGray,
                size: 20,
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Payment info row
          Row(
            children: [
              _InfoItem(label: 'Quantity', value: quantity.toString()),
              const SizedBox(width: 30),
              _InfoItem(label: 'Payment Type', value: paymentType),
              const SizedBox(width: 30),
              _InfoItem(label: 'Wallet Amount', value: walletAmount),
              const SizedBox(width: 30),
              _InfoItem(
                label: 'Status',
                value: status,
                valueColor: statusColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoItem extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;

  const _InfoItem({
    required this.label,
    required this.value,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w400,
              color: AppColors.textGray,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: valueColor ?? Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
