import 'package:flutter/material.dart';

import 'app_colors.dart';

/// Tokens de espaçamento, raios e elevação do design system.
///
/// Estilo visual: glassmorphism leve — cards com cantos arredondados (16px),
/// sombra suave e padding generoso.
abstract final class AppSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

/// Raios de borda padronizados.
abstract final class AppRadius {
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16; // Padrão dos cards
  static const double xl = 24;
  static const double pill = 999;

  static const BorderRadius card = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius button = BorderRadius.all(Radius.circular(md));
}

/// Sombras suaves para superfícies elevadas.
abstract final class AppShadows {
  static const List<BoxShadow> card = [
    BoxShadow(
      color: Color(0x140F172A), // textPrimary @ 8%
      blurRadius: 16,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> subtle = [
    BoxShadow(
      color: Color(0x0D0F172A), // textPrimary @ 5%
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}

/// Decoração padrão de card do Aioros (cantos 16px + sombra leve).
BoxDecoration aiorosCardDecoration() => BoxDecoration(
  color: AppColors.surface,
  borderRadius: AppRadius.card,
  border: Border.all(color: AppColors.border),
  boxShadow: AppShadows.card,
);
