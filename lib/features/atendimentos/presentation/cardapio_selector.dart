import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/database/app_database.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/moeda.dart';

/// Abre um seletor de cardápio (bottom sheet) para lançar itens no atendimento.
///
/// O seletor permanece aberto para lançar vários itens em sequência.
Future<void> mostrarCardapioSelector({
  required BuildContext context,
  required AppDatabase db,
  required String estabelecimentoId,
  required String atendimentoId,
}) {
  return showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(AppRadius.xl)),
    ),
    builder: (context) => _CardapioSheet(
      db: db,
      estabelecimentoId: estabelecimentoId,
      atendimentoId: atendimentoId,
    ),
  );
}

class _CardapioSheet extends StatelessWidget {
  const _CardapioSheet({
    required this.db,
    required this.estabelecimentoId,
    required this.atendimentoId,
  });

  final AppDatabase db;
  final String estabelecimentoId;
  final String atendimentoId;

  Future<void> _adicionar(BuildContext context, ItemCardapio item) async {
    await db.pedidosDao.adicionar(atendimentoId: atendimentoId, item: item);
    if (!context.mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${item.nome} adicionado'),
        duration: const Duration(milliseconds: 900),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.7,
      maxChildSize: 0.92,
      builder: (context, scrollController) {
        return Column(
          children: [
            const SizedBox(height: AppSpacing.sm),
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: AppColors.border,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Row(
                children: [
                  Text('Cardápio', style: AppTypography.title),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(LucideIcons.x),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Categoria>>(
                stream: db.cardapioDao.watchCategorias(estabelecimentoId),
                builder: (context, categoriasSnapshot) {
                  final categorias = categoriasSnapshot.data ?? const [];
                  return StreamBuilder<List<ItemCardapio>>(
                    stream: db.cardapioDao.watchItensDisponiveis(
                      estabelecimentoId,
                    ),
                    builder: (context, itensSnapshot) {
                      if (!itensSnapshot.hasData ||
                          !categoriasSnapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final itens = itensSnapshot.data ?? const [];
                      return _ListaCardapio(
                        scrollController: scrollController,
                        categorias: categorias,
                        itens: itens,
                        onAdicionar: (item) => _adicionar(context, item),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ListaCardapio extends StatelessWidget {
  const _ListaCardapio({
    required this.scrollController,
    required this.categorias,
    required this.itens,
    required this.onAdicionar,
  });

  final ScrollController scrollController;
  final List<Categoria> categorias;
  final List<ItemCardapio> itens;
  final ValueChanged<ItemCardapio> onAdicionar;

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        AppSpacing.lg,
      ),
      children: [
        for (final categoria in categorias)
          _SecaoCategoria(
            categoria: categoria,
            itens: itens.where((i) => i.categoriaId == categoria.id).toList(),
            onAdicionar: onAdicionar,
          ),
      ],
    );
  }
}

class _SecaoCategoria extends StatelessWidget {
  const _SecaoCategoria({
    required this.categoria,
    required this.itens,
    required this.onAdicionar,
  });

  final Categoria categoria;
  final List<ItemCardapio> itens;
  final ValueChanged<ItemCardapio> onAdicionar;

  @override
  Widget build(BuildContext context) {
    if (itens.isEmpty) return const SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
          child: Text(categoria.nome, style: AppTypography.subtitle),
        ),
        for (final item in itens)
          _ItemTile(item: item, onAdicionar: () => onAdicionar(item)),
        const SizedBox(height: AppSpacing.sm),
      ],
    );
  }
}

class _ItemTile extends StatelessWidget {
  const _ItemTile({required this.item, required this.onAdicionar});

  final ItemCardapio item;
  final VoidCallback onAdicionar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.sm),
        decoration: aiorosCardDecoration(),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.nome,
                    style: AppTypography.body.copyWith(
                      fontWeight: AppTypography.semiBold,
                    ),
                  ),
                  if (item.descricao != null && item.descricao!.isNotEmpty)
                    Text(
                      item.descricao!,
                      style: AppTypography.body.copyWith(
                        fontSize: 12,
                        color: AppColors.textMuted,
                      ),
                    ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    formatarCentavos(item.precoCentavos),
                    style: AppTypography.body.copyWith(
                      color: AppColors.primary,
                      fontWeight: AppTypography.semiBold,
                    ),
                  ),
                ],
              ),
            ),
            IconButton.filledTonal(
              icon: const Icon(LucideIcons.plus, size: 18),
              onPressed: onAdicionar,
            ),
          ],
        ),
      ),
    );
  }
}
