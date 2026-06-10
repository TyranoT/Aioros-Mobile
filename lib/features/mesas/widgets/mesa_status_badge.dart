import 'package:flutter/material.dart';

import '../../../core/theme/app_spacing.dart';
import '../models/mesa_status.dart';

/// Badge compacto que exibe o [MesaStatus] com sua cor, ícone e rótulo.
class MesaStatusBadge extends StatelessWidget {
  const MesaStatusBadge(this.status, {super.key});

  final MesaStatus status;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: AppSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.12),
        borderRadius: const BorderRadius.all(Radius.circular(AppRadius.pill)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: 14, color: status.color),
          const SizedBox(width: AppSpacing.xs),
          Text(
            status.label,
            style: TextStyle(
              color: status.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
