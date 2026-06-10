import 'package:aioros_app/features/mesas/models/mesa_status.dart';
import 'package:drift/drift.dart' as drift;
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
      floatingActionButton: Builder(
        builder: (context) {
          return FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (BuildContext context) {
                  return SheetCadastrarMesa(db: db, session: session);
                },
              );
            },
          );
        },
      ),
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

class SheetCadastrarMesa extends StatefulWidget {
  const SheetCadastrarMesa({
    super.key,
    required this.db,
    required this.session,
  });

  final AppDatabase db;
  final SessionController session;

  @override
  State<SheetCadastrarMesa> createState() => _SheetCadastrarMesaState();
}

class _SheetCadastrarMesaState extends State<SheetCadastrarMesa> {
  final TextEditingController _inputNomeMesa = TextEditingController.fromValue(
    TextEditingValue(text: '1'),
  );
  final TextEditingController _inputQtdCadeiras =
      TextEditingController.fromValue(TextEditingValue(text: '1'));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 275,
      child: Column(
        children: [
          ListTile(
            title: Text('Cadastrar Mesa', style: AppTypography.title),
            leading: Icon(Icons.table_restaurant, size: 24),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _inputNomeMesa,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Número da Mesa',
                prefixIcon: Icon(Icons.edit),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _inputQtdCadeiras,
              textInputAction: TextInputAction.go,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantidade de Cadeiras',
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                final mesasDao = MesasDao(widget.db);
                mesasDao.inserir(
                  MesasCompanion.insert(
                    capacidade: int.parse(_inputQtdCadeiras.text),
                    numero: int.parse(_inputNomeMesa.text),
                    estabelecimentoId: widget.session.estabelecimentoId ?? '',
                    status: drift.Value(MesaStatus.disponivel),
                    id: '',
                  ),
                );

                Navigator.pop(context);
              },
              child: Text("Salvar"),
            ),
          ),
        ],
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
