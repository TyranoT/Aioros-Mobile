import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Situação de um atendimento (sessão de serviço de uma mesa).
///
/// Segue o mesmo formato "enhanced" de `MesaStatus`: cada valor carrega seu
/// rótulo pt-BR, cor e ícone, além dos auxiliares de serialização.
enum AtendimentoStatus {
  aberto(
    label: 'Aberto',
    color: Color(0xFF2563EB), // Azul Royal
    icon: LucideIcons.conciergeBell,
  ),
  encerrado(
    label: 'Encerrado',
    color: Color(0xFF64748B), // Cinza
    icon: LucideIcons.circleCheck,
  );

  const AtendimentoStatus({
    required this.label,
    required this.color,
    required this.icon,
  });

  /// Texto exibido na UI (pt-BR).
  final String label;

  /// Cor associada ao status.
  final Color color;

  /// Ícone Lucide associado ao status.
  final IconData icon;

  /// Valor serializado (camelCase) — usado pelo Drift e por integrações.
  String get apiValue => name;

  /// Resolve um [AtendimentoStatus] a partir de um valor textual.
  ///
  /// Aceita variações comuns (espaços/acentos/separadores) por robustez.
  static AtendimentoStatus fromApi(String value) {
    final normalized = value.trim().toLowerCase().replaceAll(
      RegExp(r'[\s_-]'),
      '',
    );
    return switch (normalized) {
      'aberto' => AtendimentoStatus.aberto,
      'encerrado' => AtendimentoStatus.encerrado,
      _ => throw ArgumentError('Status de atendimento desconhecido: "$value"'),
    };
  }
}
