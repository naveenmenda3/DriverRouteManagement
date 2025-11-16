import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';
import '../widgets/user_welcome_header.dart';
import '../widgets/route_status_card.dart';
import '../widgets/booking_card.dart';
import '../widgets/quick_actions_widget.dart';
import '../widgets/bottom_navigation_widget.dart';
import '../widgets/payment_card.dart';
import '../widgets/return_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  int _selectedTopTab = 1; // 0: Delivery, 1: Pickups (default highlighted in mock), 2: Payment, 3: Back to Base

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            UserWelcomeHeader(
              userName: 'Ram',
              vehicleNumber: 'AB12-3456',
              onNotificationTap: () {},
            ),

            // Top tabs card
            RouteStatusCard(
              routeId: 'IR02720',
              deliveries: 5,
              pickups: 12,
              payments: 5,
              backToBase: 5,
              selectedIndex: _selectedTopTab,
              onDeliveryTap: () => setState(() => _selectedTopTab = 0),
              onPickupsTap: () => setState(() => _selectedTopTab = 1),
              onPaymentTap: () => setState(() => _selectedTopTab = 2),
              onBackToBaseTap: () => setState(() => _selectedTopTab = 3),
            ),

            // Body content switches by tab
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _selectedTopTab == 2
                              ? 'Payments'
                              : _selectedTopTab == 3
                                  ? 'Back to Base'
                                  : 'All Bookings',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        if (_selectedTopTab < 2)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit_outlined,
                              color: AppColors.textGray,
                              size: 25,
                            ),
                          ),
                      ],
                    ),
                  ),

                  // Lists for each tab
                  if (_selectedTopTab == 0 || _selectedTopTab == 1) ...[
                    // Delivery / Pickups share same booking card layout per mock
                    BookingCard(
                      bookingId: 'IR020251012',
                      customerName: 'VARUN',
                      serviceType: 'DRY CLEANING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: 'Arrived Just Now',
                      quantity: 2,
                      fabricType: 'Cotton',
                      status: 'N/A',
                      jobNumber: 'JOB-1',
                      onReschedule: () {},
                      onDirections: () {},
                    ),
                    BookingCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '1hr Ago',
                      quantity: 2,
                      fabricType: 'Cotton',
                      status: 'N/A',
                      jobNumber: 'JOB-2',
                      onReschedule: () {},
                      onDirections: () {},
                    ),
                    BookingCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '1hr Ago',
                      quantity: 2,
                      fabricType: 'Cotton',
                      status: 'N/A',
                      jobNumber: 'JOB-3',
                      onReschedule: () {},
                      onDirections: () {},
                    ),
                  ] else if (_selectedTopTab == 2) ...[
                    // Payments
                    PaymentCard(
                      bookingId: 'IR020251012',
                      customerName: 'VARUN',
                      serviceType: 'DRY CLEANING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: 'Arrived Just Now',
                      quantity: 2,
                      paymentType: 'Cash',
                      walletAmount: '-50.00',
                      status: 'Cancel',
                      statusColor: Colors.red,
                      jobNumber: 'JOB-1',
                    ),
                    PaymentCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '1hr Ago',
                      quantity: 2,
                      paymentType: 'Online',
                      walletAmount: '1000',
                      status: 'Success',
                      statusColor: Colors.green,
                      jobNumber: 'JOB-2',
                    ),
                    PaymentCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '1hr Ago',
                      quantity: 2,
                      paymentType: 'Wallet',
                      walletAmount: '500',
                      status: 'Processing',
                      statusColor: Colors.blue,
                      jobNumber: 'JOB-3',
                    ),
                    PaymentCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '1hr Ago',
                      quantity: 2,
                      paymentType: 'Subscription',
                      walletAmount: '600',
                      status: 'Success',
                      statusColor: Colors.green,
                      jobNumber: 'JOB-4',
                    ),
                  ] else ...[
                    // Back to Base
                    ReturnCard(
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
                    ReturnCard(
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
                    ReturnCard(
                      bookingId: 'IR020251001',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '25 AUG 2025, 10:00AM - 12:00 PM',
                      quantity: 2,
                      fabricType: 'Cotton',
                      status: 'Return',
                      statusColor: Colors.red,
                      jobNumber: 'JOB-3',
                    ),
                    ReturnCard(
                      bookingId: 'IR020251002',
                      customerName: 'SAI KUMAR',
                      serviceType: 'IRONING',
                      pickupAddress: 'Area Name, City',
                      timeInfo: '25 AUG 2025, 10:00AM - 12:00 PM',
                      quantity: 2,
                      fabricType: 'Cotton',
                      status: 'Return',
                      statusColor: Colors.red,
                      jobNumber: 'JOB-4',
                    ),
                  ],

                  const SizedBox(height: 16),

                  // Quick actions
                  QuickActionsWidget(
                    actions: [
                      QuickAction(
                        title: 'Request for Reschedule',
                        icon: Icons.schedule,
                        iconColor: Colors.blue,
                        onTap: () {},
                      ),
                      QuickAction(
                        title: 'Requests for Edit Booking',
                        icon: Icons.edit_calendar,
                        iconColor: Colors.green,
                        onTap: () {},
                      ),
                      QuickAction(
                        title: '24/7 Chat support',
                        icon: Icons.chat_bubble_outline,
                        iconColor: Colors.orange,
                        onTap: () {},
                      ),
                      QuickAction(
                        title: 'FAQs',
                        icon: Icons.help_outline,
                        iconColor: Colors.purple,
                        onTap: () {},
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
