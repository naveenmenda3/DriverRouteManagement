import 'package:flutter/material.dart';
import '../constants/app_text_styles.dart';
import '../models/intro_data.dart';

class IntroPageWidget extends StatelessWidget {
  final IntroData data;

  const IntroPageWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 40),

          // Image container with exact design specifications
          Container(
            height: screenHeight * 0.4,
            width: screenWidth * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: 20,
                  offset: const Offset(0, 8),
                  spreadRadius: 0,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                data.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image_not_supported_outlined,
                            size: 48,
                            color: Colors.grey[500],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Image not found',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 40),

          // Title with exact text styling
          Text(
            data.title,
            textAlign: TextAlign.center,
            style: AppTextStyles.introTitle,
          ),

          const SizedBox(height: 16),

          // Subtitle with exact text styling
          Text(
            data.subtitle,
            textAlign: TextAlign.center,
            style: AppTextStyles.introSubtitle,
          ),
        ],
      ),
    );
  }
}
