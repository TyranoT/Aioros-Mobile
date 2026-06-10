part of '../app_database.dart';

/// Acesso a dados das mesas.
@DriftAccessor(tables: [Mesas])
class MesasDao extends DatabaseAccessor<AppDatabase> with _$MesasDaoMixin {
  MesasDao(super.db);

  /// Observa as mesas do estabelecimento, ordenadas por número.
  Stream<List<Mesa>> watchMesas(String estabelecimentoId) {
    return (select(mesas)
          ..where((m) => m.estabelecimentoId.equals(estabelecimentoId))
          ..orderBy([(m) => OrderingTerm.asc(m.numero)]))
        .watch();
  }

  /// Observa uma única mesa pelo id.
  Stream<Mesa> watchMesa(String id) =>
      (select(mesas)..where((m) => m.id.equals(id))).watchSingle();

  /// Busca uma mesa pelo id (ou `null`).
  Future<Mesa?> mesaPorId(String id) =>
      (select(mesas)..where((m) => m.id.equals(id))).getSingleOrNull();

  /// Atualiza apenas o status de uma mesa.
  Future<void> atualizarStatus(String id, MesaStatus status) {
    return (update(mesas)..where((m) => m.id.equals(id))).write(
      MesasCompanion(status: Value(status)),
    );
  }

  Future<void> inserir(MesasCompanion mesa) => into(mesas).insert(mesa);

  Future<void> atualizar(Mesa mesa) => update(mesas).replace(mesa);

  Future<void> excluir(String id) =>
      (delete(mesas)..where((m) => m.id.equals(id))).go();
}
