import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

/// Tipografia do Aioros — fonte **Inter** (Bold 700 / SemiBold 600 / Regular 400).
abstract final class AppTypography {
  /// TextTheme completo em Inter, com a paleta de texto aplicada.
  static TextTheme textTheme(TextTheme base) {
    final theme = GoogleFonts.interTextTheme(base);
    return theme.apply(
      bodyColor: AppColors.textPrimary,
      displayColor: AppColors.textPrimary,
    );
  }

  // Pesos canônicos da marca.
  static const FontWeight bold = FontWeight.w700;
  static const FontWeight semiBold = FontWeight.w600;
  static const FontWeight regular = FontWeight.w400;

  /// Título de tela / seção (Inter Bold).
  static TextStyle title = GoogleFonts.inter(
    fontSize: 22,
    fontWeight: bold,
    color: AppColors.textPrimary,
    height: 1.2,
  );

  /// Subtítulo (Inter SemiBold).
  static TextStyle subtitle = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: semiBold,
    color: AppColors.textSecondary,
  );

  /// Rótulo de botão (Inter SemiBold).
  static TextStyle button = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: semiBold,
  );

  /// Texto de corpo (Inter Regular).
  static TextStyle body = GoogleFonts.inter(
    fontSize: 14,
    fontWeight: regular,
    color: AppColors.textPrimary,
  );
}
