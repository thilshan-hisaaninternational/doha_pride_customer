import 'package:flutter/material.dart';

// class AppColors {
//   // Light Theme Colors (from your portal CSS)
//   static const primary = Color(0xFF8B1D3D);
//   static const secondary = Color(0xFF1F8A9B);
//   static const accent = Color(0xFF6EC1CC);
//   static const neutralLight = Color(0xFFE6E6E6);
//   static const white = Color(0xFFFFFFFF);

//   // Dark Theme Colors (future ready)
//   static const darkBackground = Color(0xFF121212);
//   static const darkSurface = Color(0xFF1E1E1E);
//   static const darkText = Color(0xFFFFFFFF);
// }

class AppColors {
  AppColors._();

  // Brand
  static const Color primary = Color(0xFF8B1D3D);
  static const Color secondary = Color(0xFF1F8A9B);
  static const Color accent = Color(0xFF6EC1CC);

  // Background
  // static const Color dustyBackground = Color(0xFFE6E6E6);
  static const Color background = Color(0xFFF8F9FA);

  static const Color surface = Color(0xFFFFFFFF);

  // Text (THIS fixes your error)
  static const Color textPrimary = Color(0xFF1A1A2E);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textHint = Color(0xFFB0B7C3);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Dark Theme
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkText = Color(0xFFFFFFFF);

  // Misc
  static const Color divider = Color(0xFFE5E7EB);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHigh = Color(0xFFF5F5F5);

  // Error
  static const Color error = Color(0xFFB00020);
  static const Color success = Color(0xFF4CAF50);

  //Card bg
  static const Color cardBg = Color(0xFFFFFFFF);
}