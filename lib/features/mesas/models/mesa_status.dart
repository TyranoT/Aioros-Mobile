import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Status operacional de uma [Mesa].
///
/// Cada status tem cor, rótulo (pt-BR) e ícone próprios para que o garçom
/// identifique a situação da mesa "batendo o olho".
enum MesaStatus {
  disponivel(
    label: 'Disponível',
    color: Color(0xFF22C55E), // Verde
    icon: LucideIcons.circleCheck,
  ),
  ocupada(
    label: 'Ocupada',
    color: Color(0xFFEF4444), // Vermelho
    icon: LucideIcons.users,
  ),
  emAtendimento(
    label: 'Em Atendimento',
    color: Color(0xFF2563EB), // Azul Royal
    icon: LucideIcons.conciergeBell,
  ),
  reservada(
    label: 'Reservada',
    color: Color(0xFFF59E0B), // Amarelo
    icon: LucideIcons.calendarClock,
  ),
  limpeza(
    label: 'Limpeza',
    color: Color(0xFF8B5CF6), // Roxo
    icon: LucideIcons.sparkles,
  ),
  indisponivel(
    label: 'Indisponível',
    color: Color(0xFF64748B), // Cinza
    icon: LucideIcons.ban,
  );

  const MesaStatus({
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

  /// Valor serializado usado pela API REST (camelCase).
  String get apiValue => name;

  /// Resolve um [MesaStatus] a partir do valor vindo da API.
  ///
  /// Aceita variações comuns (snake_case / espaços / acentos) por robustez.
  static MesaStatus fromApi(String value) {
    final normalized = value.trim().toLowerCase().replaceAll(
      RegExp(r'[\s_-]'),
      '',
    );
    return switch (normalized) {
      'disponivel' || 'disponível' => MesaStatus.disponivel,
      'ocupada' => MesaStatus.ocupada,
      'ematendimento' => MesaStatus.emAtendimento,
      'reservada' => MesaStatus.reservada,
      'limpeza' => MesaStatus.limpeza,
      'indisponivel' || 'indisponível' => MesaStatus.indisponivel,
      _ => throw ArgumentError('Status de mesa desconhecido: "$value"'),
    };
  }
}
