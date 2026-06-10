part of '../app_database.dart';

/// Acesso a dados dos garçons.
@DriftAccessor(tables: [Garcons])
class GarconsDao extends DatabaseAccessor<AppDatabase> with _$GarconsDaoMixin {
  GarconsDao(super.db);

  /// Busca um garçom ativo pelo código de login (ou `null` se inexistente).
  Future<Garcom?> garconPorCodigo(String codigo) {
    return (select(garcons)
          ..where((g) => g.codigo.equals(codigo) & g.ativo.equals(true)))
        .getSingleOrNull();
  }

  /// Observa os garçons do estabelecimento, ordenados por nome.
  Stream<List<Garcom>> watchGarcons(String estabelecimentoId) {
    return (select(garcons)
          ..where((g) => g.estabelecimentoId.equals(estabelecimentoId))
          ..orderBy([(g) => OrderingTerm.asc(g.nome)]))
        .watch();
  }

  Future<List<Garcom>> garconsDoEstabelecimento(String estabelecimentoId) {
    return (select(
      garcons,
    )..where((g) => g.estabelecimentoId.equals(estabelecimentoId))).get();
  }
}
