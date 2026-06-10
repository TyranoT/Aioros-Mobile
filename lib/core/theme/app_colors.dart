import 'package:flutter/material.dart';

/// Paleta de cores do Aioros.
///
/// Baseada no conceito de marca: visual moderno SaaS, transmitindo
/// confiança (azul), disponibilidade (verde), alerta (amarelo) e
/// urgência (vermelho).
abstract final class AppColors {
  // Cores de marca
  static const Color primary = Color(0xFF2563EB); // Azul Royal — ações
  static const Color secondary = Color(0xFF22C55E); // Verde — sucesso
  static const Color success = Color(0xFF22C55E);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);

  // Superfícies e texto
  static const Color background = Color(0xFFF8FAFC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF0F172A); // Azul escuro

  // Tons de texto derivados (Slate)
  static const Color textSecondary = Color(0xFF475569);
  static const Color textMuted = Color(0xFF94A3B8);

  // Bordas e divisores
  static const Color border = Color(0xFFE2E8F0);

  // Cores de contraste sobre superfícies coloridas
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSurface = Color(0xFF0F172A);
}
