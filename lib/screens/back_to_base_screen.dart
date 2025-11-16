import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/user_welcome_header.dart';
import '../widgets/route_status_card.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/bottom_navigation_widget.dart';

class BackToBaseScreen extends StatefulWidget {
  const BackToBaseScreen({super.key});

  @override
  State<BackToBaseScreen> createState() => _BackToBaseScreenState();
}

class _BackToBaseScreenState extends State<BackToBaseScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // User welcome header
            UserWelcomeHeader(
              userName: 'Ram',
              vehicleNumber: 'AB12-3456',
              onNotificationTap: () {
                // Handle notification tap
              },
            ),

            // Route status card with Back to Base highlighted
            RouteStatusCard(
              routeId: 'IR02720',
              deliveries: 5,
              pickups: 12,
              payments: 5,
              backToBase: 5,
            ),

            // Back to Base section
            Expanded(
              child: Column(
                children: [
                  // Section header
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      children: [
                        Text(
                          'Back to Base',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Back to Base cards list
                  Expanded(
                    child: ListView(
                      children: [
                        _BackToBaseCard(
                          bookingId: 'IR020251001',
                          customerName: 'SAI KUMAR',
                          serviceType: 'IRONING',
                          pickupAddress: 'Area Name, City',
                          timeInfo: '1hr Ago',
                          quantity: 2,
                          fabricType: 'Cotton',
                          status: 'Return',
                          statusColor: Colors.red,
                          jobNumber: 'JOB-1',
                        ),
                        _BackToBaseCard(
                          bookingId: 'IR020251001',
                          customerName: 'SAI KUMAR',
                          serviceType: 'IRONING',
                          pickupAddress: 'Area Name, City',
                          timeInfo: '1hr Ago',
                          quantity: 2,
                          fabricType: 'Cotton',
                          status: 'Return',
                          statusColor: Colors.red,
                          jobNumber: 'JOB-2',
                        ),
                        _BackToBaseCard(
                          bookingId: 'IR020251001',
                          customerName: 'SAI KUMAR',
                          serviceType: 'IRONING',
                          pickupAddress: 'Area Name, City',
                          timeInfo: 'DELIVERY WINDOW : 12:00 PM',
                          quantity: 2,
                          fabricType: 'Cotton',
                          status: 'Return',
                          statusColor: Colors.red,
                          jobNumber: 'JOB-3',
                        ),
                        _BackToBaseCard(
                          bookingId: 'IR020251002',
                          customerName: 'SAI KUMAR',
                          serviceType: 'IRONING',
                          pickupAddress: 'Area Name, City',
                          timeInfo: 'DELIVERY WINDOW : 12:00 PM',
                          quantity: 2,
                          fabricType: 'Cotton',
                          status: 'Return',
                          statusColor: Colors.red,
                          jobNumber: 'JOB-4',
                        ),

                        const SizedBox(height: 16),

                        // Quick actions
                        QuickActionsWidget(
                          actions: [
                            QuickAction(
                              title: 'Request for Reschedule',
                              icon: Icons.schedule,
                              iconColor: Colors.blue,
                              onTap: () {
                                // Handle reschedule request
                              },
                            ),
                            QuickAction(
                              title: 'Requests for Edit Booking',
                              icon: Icons.edit_calendar,
                              iconColor: Colors.green,
                              onTap: () {
                                // Handle edit booking request
                              },
                            ),
                            QuickAction(
                              title: '24/7 Chat support',
                              icon: Icons.chat_bubble_outline,
                              iconColor: Colors.orange,
                              onTap: () {
                                // Handle chat support
                              },
                            ),
                            QuickAction(
                              title: 'FAQs',
                              icon: Icons.help_outline,
                              iconColor: Colors.purple,
                              onTap: () {
                                // Handle FAQs
                              },
                            ),
                          ],
                        ),

                        const SizedBox(height: 100),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class _BackToBaseCard extends StatelessWidget {
  final String bookingId;
  final String customerName;
  final String serviceType;
  final String pickupAddress;
  final String timeInfo;
  final int quantity;
  final String fabricType;
  final String status;
  final Color statusColor;
  final String jobNumber;

  const _BackToBaseCard({
    required this.bookingId,
    required this.customerName,
    required this.serviceType,
    required this.pickupAddress,
    required this.timeInfo,
    required this.quantity,
    required this.fabricType,
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
                            : timeInfo.toUpperCase().contains('DELIVERY WINDOW')
                            ? Colors.blue
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

          // Info row
          Row(
            children: [
              _InfoItem(label: 'Quantity', value: quantity.toString()),
              const SizedBox(width: 40),
              _InfoItem(label: 'Fabric type', value: fabricType),
              const SizedBox(width: 40),
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
