import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/database/app_database.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../widgets/mesa_status_badge.dart';

/// Tela inicial do garçom: grade com todas as mesas e seus status.
class MesasPage extends StatelessWidget {
  const MesasPage({super.key, required this.session, required this.db});

  final SessionController session;
  final AppDatabase db;

  @override
  Widget build(BuildContext context) {
    final estabelecimentoId = session.estabelecimentoId;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Mesas'),
            if (session.nomeUsuario != null)
              Text(
                'Olá, ${session.nomeUsuario}',
                style: AppTypography.body.copyWith(
                  color: AppColors.textMuted,
                  fontSize: 12,
                ),
              ),
          ],
        ),
        actions: [
          IconButton(
            tooltip: 'Sair',
            icon: const Icon(LucideIcons.logOut),
            onPressed: session.logout,
          ),
        ],
      ),
      body: estabelecimentoId == null
          ? const SizedBox.shrink()
          : StreamBuilder<List<Mesa>>(
              stream: db.mesasDao.watchMesas(estabelecimentoId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final mesas = snapshot.data ?? const [];
                if (mesas.isEmpty) {
                  return const _MesasVazias();
                }
                return _GradeMesas(mesas: mesas);
              },
            ),
    );
  }
}

/// Grade responsiva de mesas: ajusta colunas conforme a largura disponível.
class _GradeMesas extends StatelessWidget {
  const _GradeMesas({required this.mesas});

  final List<Mesa> mesas;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final colunas = (constraints.maxWidth / 180).floor().clamp(2, 6);
        return GridView.builder(
          padding: const EdgeInsets.all(AppSpacing.md),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: colunas,
            mainAxisSpacing: AppSpacing.md,
            crossAxisSpacing: AppSpacing.md,
            childAspectRatio: 1,
          ),
          itemCount: mesas.length,
          itemBuilder: (context, index) => _MesaCard(mesa: mesas[index]),
        );
      },
    );
  }
}

class _MesaCard extends StatelessWidget {
  const _MesaCard({required this.mesa});

  final Mesa mesa;

  @override
  Widget build(BuildContext context) {
    final status = mesa.status;
    return InkWell(
      onTap: () => context.go('/mesas/${mesa.id}'),
      borderRadius: AppRadius.card,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: aiorosCardDecoration().copyWith(
          border: Border.all(color: status.color.withValues(alpha: 0.4)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(status.icon, color: status.color, size: 20),
                const Spacer(),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.users,
                      size: 14,
                      color: AppColors.textMuted,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      '${mesa.capacidade}',
                      style: AppTypography.body.copyWith(
                        color: AppColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Spacer(),
            Text(
              'Mesa ${mesa.numero}',
              style: AppTypography.title.copyWith(fontSize: 20),
            ),
            const SizedBox(height: AppSpacing.sm),
            MesaStatusBadge(status),
          ],
        ),
      ),
    );
  }
}

class _MesasVazias extends StatelessWidget {
  const _MesasVazias();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            LucideIcons.layoutGrid,
            size: 48,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: AppSpacing.md),
          Text('Nenhuma mesa cadastrada.', style: AppTypography.subtitle),
        ],
      ),
    );
  }
}
