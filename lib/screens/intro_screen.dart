import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/intro_data.dart';
import '../widgets/intro_page_widget.dart';
import '../widgets/page_indicator.dart';
import '../widgets/custom_button.dart';
import 'home_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final List<IntroData> _introData = IntroData.introScreens;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToNextPage() {
    if (_currentPage < _introData.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _skipToLastPage() {
    _pageController.animateToPage(
      _introData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _introData.length - 1;

    return Scaffold(
      backgroundColor: AppColors.lightBlue,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),

            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _introData.length,
                itemBuilder: (context, index) {
                  return IntroPageWidget(data: _introData[index]);
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Page indicator first
                  const SizedBox(height: 30),

                  // Buttons with exact width specifications
                  if (!isLastPage) ...[
                    // Skip and Next buttons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CustomButton(
                          text: 'Skip',
                          onPressed: _skipToLastPage,
                          isPrimary: false,
                          width: 156,
                        ),
                        CustomButton(
                          text: 'Next',
                          onPressed: _navigateToNextPage,
                          isPrimary: true,
                          width: 156,
                        ),
                      ],
                    ),
                  ] else ...[
                    // Get In Now button - full width for last screen
                    Center(
                      child: CustomButton(
                        text: 'Get In Now',
                        onPressed: _navigateToHome,
                        isPrimary: true,
                        width: double.infinity,
                      ),
                    ),
                  ],
                  SizedBox(height: 30,),
                  PageIndicator(
                    currentPage: _currentPage,
                    totalPages: _introData.length,
                  ),
                  SizedBox(height: 40,),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
