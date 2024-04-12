import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Styles class holding app text styles
class AppTextStyles {
  /// Text style for heading 1 text
  static TextStyle title = GoogleFonts.montserrat(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  /// Text style for heading 2 text
  static TextStyle subtitle = GoogleFonts.montserrat(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.titleColor,
  );

  /// Text style for titleSm Button
  static TextStyle buttonText = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.titleColor,
  );
  static TextStyle bodyLg = GoogleFonts.montserrat(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );

  /// Text style for body text
  static TextStyle body = GoogleFonts.montserrat(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.bodyColor,
  );
}
