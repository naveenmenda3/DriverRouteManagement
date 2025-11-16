import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/notification_card.dart';
import '../constants/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Top bar with back chevron and centered title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left,size: 30,),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  Expanded(
                    child: Text(
                      'Notification',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const SizedBox(width: 40), // spacer to balance back button
                ],
              ),
            ),

            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(bottom: 30),
                children: const [
                  NotificationCard(
                    imageAsset: 'assets/images/introimg1.png',
                    bookingId: 'IRO202510012',
                    customerName: 'VARUN',
                    serviceType: 'DRY CLEANING',
                    address: '"Area Name, City"',
                    timeRange: '10:00 AM –12:00 PM',
                    badgeLabel: 'Pickup',
                    badgeColor: AppColors.primaryBlue,
                  ),
                  NotificationCard(
                    imageAsset: 'assets/images/introimg2.png',
                    bookingId: 'IRO202510012',
                    customerName: 'VARUN',
                    serviceType: 'DRY CLEANING',
                    address: '"Area Name, City"',
                    timeRange: '10:00 AM –12:00 PM',
                    badgeLabel: 'Delivery',
                    badgeColor: Colors.red,
                  ),
                  NotificationCard(
                    imageAsset: 'assets/images/introimg1.png',
                    bookingId: 'IRO202510012',
                    customerName: 'VARUN',
                    serviceType: 'DRY CLEANING',
                    address: '"Area Name, City"',
                    timeRange: '10:00 AM –12:00 PM',
                    badgeLabel: 'Pickup',
                    badgeColor: AppColors.primaryBlue,
                  ),
                  NotificationCard(
                    imageAsset: 'assets/images/introimg2.png',
                    bookingId: 'IRO202510012',
                    customerName: 'VARUN',
                    serviceType: 'DRY CLEANING',
                    address: '"Area Name, City"',
                    timeRange: '10:00 AM –12:00 PM',
                    badgeLabel: 'Delivery',
                    badgeColor: Colors.red,
                  ),
                ],
              ),
            ),

            // bottom big X control (modal-close look)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 12,
                            offset: const Offset(0, 2),
                          )
                        ],
                      ),
                      child: const Icon(Icons.close, size: 34, color: Colors.black54),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
