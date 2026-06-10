import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

/// Situação de um item pedido dentro de um atendimento.
///
/// Itens `cancelado` não entram no total da conta. Segue o formato "enhanced"
/// de `MesaStatus` (rótulo pt-BR + cor + ícone + serialização).
enum ItemPedidoStatus {
  pendente(
    label: 'Pendente',
    color: Color(0xFFF59E0B), // Amarelo
    icon: LucideIcons.clock,
  ),
  preparando(
    label: 'Preparando',
    color: Color(0xFF2563EB), // Azul Royal
    icon: LucideIcons.cookingPot,
  ),
  entregue(
    label: 'Entregue',
    color: Color(0xFF22C55E), // Verde
    icon: LucideIcons.circleCheck,
  ),
  cancelado(
    label: 'Cancelado',
    color: Color(0xFFEF4444), // Vermelho
    icon: LucideIcons.ban,
  );

  const ItemPedidoStatus({
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

  /// Indica se o item conta para o valor da conta.
  bool get contaNoTotal => this != ItemPedidoStatus.cancelado;

  /// Valor serializado (camelCase) — usado pelo Drift e por integrações.
  String get apiValue => name;

  /// Resolve um [ItemPedidoStatus] a partir de um valor textual.
  static ItemPedidoStatus fromApi(String value) {
    final normalized = value.trim().toLowerCase().replaceAll(
      RegExp(r'[\s_-]'),
      '',
    );
    return switch (normalized) {
      'pendente' => ItemPedidoStatus.pendente,
      'preparando' => ItemPedidoStatus.preparando,
      'entregue' => ItemPedidoStatus.entregue,
      'cancelado' => ItemPedidoStatus.cancelado,
      _ => throw ArgumentError('Status de item desconhecido: "$value"'),
    };
  }
}
