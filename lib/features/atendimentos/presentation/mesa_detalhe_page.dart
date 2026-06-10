import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/database/app_database.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';
import '../../../core/utils/duracao.dart';
import '../../../core/utils/moeda.dart';
import '../../mesas/widgets/mesa_status_badge.dart';
import '../../pedidos/models/item_pedido_status.dart';
import 'cardapio_selector.dart';

/// Tela de detalhe de uma mesa: abre/fecha atendimento, lança pedidos, mostra
/// total da conta e há quanto tempo cada pedido foi feito.
class MesaDetalhePage extends StatefulWidget {
  const MesaDetalhePage({
    super.key,
    required this.mesaId,
    required this.session,
    required this.db,
  });

  final String mesaId;
  final SessionController session;
  final AppDatabase db;

  @override
  State<MesaDetalhePage> createState() => _MesaDetalhePageState();
}

class _MesaDetalhePageState extends State<MesaDetalhePage> {
  /// Ticker que atualiza os "há X min" exibidos na tela.
  Timer? _ticker;

  @override
  void initState() {
    super.initState();
    _ticker = Timer.periodic(
      const Duration(seconds: 30),
      (_) => setState(() {}),
    );
  }

  @override
  void dispose() {
    _ticker?.cancel();
    super.dispose();
  }

  Future<void> _abrirAtendimento() async {
    final garcom = widget.session.garcom;
    if (garcom == null) return;
    await widget.db.atendimentosDao.abrir(widget.mesaId, garcom.id);
  }

  Future<void> _fecharConta(Atendimento atendimento, int totalCentavos) async {
    final confirmado = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Fechar conta'),
        content: Text(
          'Encerrar o atendimento desta mesa?\n'
          'Total: ${formatarCentavos(totalCentavos)}',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Fechar conta'),
          ),
        ],
      ),
    );
    if (confirmado != true) return;
    await widget.db.atendimentosDao.encerrar(atendimento.id, widget.mesaId);
  }

  Future<void> _adicionarPedido(Atendimento atendimento) async {
    final estabelecimentoId = widget.session.estabelecimentoId;
    if (estabelecimentoId == null) return;
    await mostrarCardapioSelector(
      context: context,
      db: widget.db,
      estabelecimentoId: estabelecimentoId,
      atendimentoId: atendimento.id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => context.go('/mesas'),
        ),
      ),
      body: StreamBuilder<Mesa>(
        stream: widget.db.mesasDao.watchMesa(widget.mesaId),
        builder: (context, mesaSnapshot) {
          final mesa = mesaSnapshot.data;
          if (mesa == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return StreamBuilder<Atendimento?>(
            stream: widget.db.atendimentosDao.watchAtendimentoAberto(
              widget.mesaId,
            ),
            builder: (context, atendimentoSnapshot) {
              final atendimento = atendimentoSnapshot.data;
              return _Conteudo(
                mesa: mesa,
                atendimento: atendimento,
                podeAbrir: widget.session.garcom != null,
                db: widget.db,
                onAbrir: _abrirAtendimento,
                onAdicionar: _adicionarPedido,
                onFechar: _fecharConta,
              );
            },
          );
        },
      ),
    );
  }
}

class _Conteudo extends StatelessWidget {
  const _Conteudo({
    required this.mesa,
    required this.atendimento,
    required this.podeAbrir,
    required this.db,
    required this.onAbrir,
    required this.onAdicionar,
    required this.onFechar,
  });

  final Mesa mesa;
  final Atendimento? atendimento;
  final bool podeAbrir;
  final AppDatabase db;
  final Future<void> Function() onAbrir;
  final Future<void> Function(Atendimento atendimento) onAdicionar;
  final Future<void> Function(Atendimento atendimento, int totalCentavos)
  onFechar;

  @override
  Widget build(BuildContext context) {
    final atendimentoAtual = atendimento;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.md,
            0,
            AppSpacing.md,
            AppSpacing.md,
          ),
          child: _CabecalhoMesa(mesa: mesa, atendimento: atendimentoAtual),
        ),
        if (atendimentoAtual == null)
          Expanded(
            child: _MesaSemAtendimento(podeAbrir: podeAbrir, onAbrir: onAbrir),
          )
        else
          Expanded(
            child: _PainelAtendimento(
              atendimento: atendimentoAtual,
              db: db,
              onAdicionar: onAdicionar,
              onFechar: onFechar,
            ),
          ),
      ],
    );
  }
}

class _CabecalhoMesa extends StatelessWidget {
  const _CabecalhoMesa({required this.mesa, required this.atendimento});

  final Mesa mesa;
  final Atendimento? atendimento;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: aiorosCardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Mesa ${mesa.numero}',
                style: AppTypography.title.copyWith(fontSize: 24),
              ),
              const Spacer(),
              MesaStatusBadge(mesa.status),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              const Icon(
                LucideIcons.users,
                size: 16,
                color: AppColors.textMuted,
              ),
              const SizedBox(width: AppSpacing.xs),
              Text(
                '${mesa.capacidade} lugares',
                style: AppTypography.body.copyWith(color: AppColors.textMuted),
              ),
              if (atendimento != null) ...[
                const SizedBox(width: AppSpacing.md),
                const Icon(
                  LucideIcons.clock,
                  size: 16,
                  color: AppColors.textMuted,
                ),
                const SizedBox(width: AppSpacing.xs),
                Text(
                  'aberta ${tempoDecorrido(atendimento!.abertura)}',
                  style: AppTypography.body.copyWith(
                    color: AppColors.textMuted,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _MesaSemAtendimento extends StatelessWidget {
  const _MesaSemAtendimento({required this.podeAbrir, required this.onAbrir});

  final bool podeAbrir;
  final Future<void> Function() onAbrir;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              LucideIcons.conciergeBell,
              size: 48,
              color: AppColors.textMuted,
            ),
            const SizedBox(height: AppSpacing.md),
            Text(
              'Mesa sem atendimento em aberto.',
              style: AppTypography.subtitle,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.lg),
            if (podeAbrir)
              FilledButton.icon(
                onPressed: onAbrir,
                icon: const Icon(LucideIcons.play, size: 18),
                label: const Text('Abrir atendimento'),
              )
            else
              Text(
                'Apenas garçons podem abrir atendimentos.',
                style: AppTypography.body.copyWith(color: AppColors.textMuted),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}

class _PainelAtendimento extends StatelessWidget {
  const _PainelAtendimento({
    required this.atendimento,
    required this.db,
    required this.onAdicionar,
    required this.onFechar,
  });

  final Atendimento atendimento;
  final AppDatabase db;
  final Future<void> Function(Atendimento atendimento) onAdicionar;
  final Future<void> Function(Atendimento atendimento, int totalCentavos)
  onFechar;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PedidoComItem>>(
      stream: db.pedidosDao.watchPedidos(atendimento.id),
      builder: (context, snapshot) {
        final pedidos = snapshot.data ?? const <PedidoComItem>[];
        final total = pedidos
            .where((p) => p.pedido.status.contaNoTotal)
            .fold<int>(0, (soma, p) => soma + p.subtotalCentavos);

        return Column(
          children: [
            Expanded(
              child: pedidos.isEmpty
                  ? const _PedidosVazios()
                  : ListView.separated(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.md,
                      ),
                      itemCount: pedidos.length,
                      separatorBuilder: (_, _) =>
                          const SizedBox(height: AppSpacing.sm),
                      itemBuilder: (context, index) => _PedidoTile(
                        pedidoComItem: pedidos[index],
                        onCancelar: () =>
                            db.pedidosDao.cancelar(pedidos[index].pedido.id),
                      ),
                    ),
            ),
            _RodapeConta(
              totalCentavos: total,
              onAdicionar: () => onAdicionar(atendimento),
              onFechar: () => onFechar(atendimento, total),
            ),
          ],
        );
      },
    );
  }
}

class _PedidoTile extends StatelessWidget {
  const _PedidoTile({required this.pedidoComItem, required this.onCancelar});

  final PedidoComItem pedidoComItem;
  final VoidCallback onCancelar;

  @override
  Widget build(BuildContext context) {
    final pedido = pedidoComItem.pedido;
    final item = pedidoComItem.item;
    final cancelado = pedido.status == ItemPedidoStatus.cancelado;

    return Opacity(
      opacity: cancelado ? 0.55 : 1,
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.md),
        decoration: aiorosCardDecoration(),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${pedido.quantidade}× ${item.nome}',
                    style: AppTypography.body.copyWith(
                      fontWeight: AppTypography.semiBold,
                      decoration: cancelado ? TextDecoration.lineThrough : null,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Row(
                    children: [
                      Icon(
                        pedido.status.icon,
                        size: 12,
                        color: pedido.status.color,
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      Text(
                        pedido.status.label,
                        style: AppTypography.body.copyWith(
                          fontSize: 12,
                          color: pedido.status.color,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sm),
                      Text(
                        tempoDecorrido(pedido.criadoEm),
                        style: AppTypography.body.copyWith(
                          fontSize: 12,
                          color: AppColors.textMuted,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  formatarCentavos(pedidoComItem.subtotalCentavos),
                  style: AppTypography.body.copyWith(
                    fontWeight: AppTypography.semiBold,
                    decoration: cancelado ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (!cancelado)
                  TextButton(
                    onPressed: onCancelar,
                    style: TextButton.styleFrom(
                      foregroundColor: AppColors.error,
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 28),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text('Cancelar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _RodapeConta extends StatelessWidget {
  const _RodapeConta({
    required this.totalCentavos,
    required this.onAdicionar,
    required this.onFechar,
  });

  final int totalCentavos;
  final VoidCallback onAdicionar;
  final VoidCallback onFechar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
        boxShadow: AppShadows.card,
      ),
      child: SafeArea(
        top: false,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total da conta',
                  style: AppTypography.subtitle.copyWith(
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  formatarCentavos(totalCentavos),
                  style: AppTypography.title.copyWith(color: AppColors.primary),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: onAdicionar,
                    icon: const Icon(LucideIcons.plus, size: 18),
                    label: const Text('Adicionar'),
                  ),
                ),
                const SizedBox(width: AppSpacing.md),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: onFechar,
                    icon: const Icon(LucideIcons.receipt, size: 18),
                    label: const Text('Fechar conta'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PedidosVazios extends StatelessWidget {
  const _PedidosVazios();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            LucideIcons.clipboardList,
            size: 40,
            color: AppColors.textMuted,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            'Nenhum pedido lançado ainda.',
            style: AppTypography.body.copyWith(color: AppColors.textMuted),
          ),
        ],
      ),
    );
  }
}
