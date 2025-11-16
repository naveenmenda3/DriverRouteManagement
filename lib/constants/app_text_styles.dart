import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  // Splash screen text styles - Pixel Perfect
  static TextStyle get splashTitle => GoogleFonts.kanit(
    fontSize: 47.31,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFE6EDF6),
    letterSpacing: 0,
    height: 1.2,
    textStyle: const TextStyle(
      decoration: TextDecoration.none,
    ),
  );

  static TextStyle get splashSubtitle => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: const Color(0xFFE6EDF6),
    letterSpacing: 0,
    height: 1.4,
    textStyle: const TextStyle(
      decoration: TextDecoration.none,
    ),
  );

  static TextStyle get splashDescription => GoogleFonts.inter(
    fontSize: 23.59,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFE6EDF6),
    letterSpacing: 0,
    height: 1.4,
    textStyle: const TextStyle(
      decoration: TextDecoration.none,
    ),
  );

  // Intro screen text styles - Pixel Perfect
  static TextStyle get introTitle => GoogleFonts.inter(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: const Color(0xFF084DA6),
    letterSpacing: 0,
    height: 1.4, // 140% line height
    textStyle: const TextStyle(
      decoration: TextDecoration.none,
    ),
  );

  static TextStyle get introSubtitle => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: const Color(0xFF757E8A),
    letterSpacing: 0,
    height: 1.4,
    textStyle: const TextStyle(
      decoration: TextDecoration.none,
    ),
  );

  // Button text styles
  static TextStyle get buttonPrimary => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static TextStyle get buttonSecondary => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFF084DA6),
  );

  // Status bar text
  static TextStyle get statusBar => GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
