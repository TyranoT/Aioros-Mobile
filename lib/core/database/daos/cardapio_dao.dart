part of '../app_database.dart';

/// Acesso a dados do cardápio (categorias e itens).
@DriftAccessor(tables: [Categorias, ItensCardapio])
class CardapioDao extends DatabaseAccessor<AppDatabase>
    with _$CardapioDaoMixin {
  CardapioDao(super.db);

  /// Observa as categorias do estabelecimento, ordenadas por `ordem` e nome.
  Stream<List<Categoria>> watchCategorias(String estabelecimentoId) {
    return (select(categorias)
          ..where((c) => c.estabelecimentoId.equals(estabelecimentoId))
          ..orderBy([
            (c) => OrderingTerm.asc(c.ordem),
            (c) => OrderingTerm.asc(c.nome),
          ]))
        .watch();
  }

  /// Observa todos os itens do cardápio do estabelecimento.
  Stream<List<ItemCardapio>> watchItens(String estabelecimentoId) {
    return (select(itensCardapio)
          ..where((i) => i.estabelecimentoId.equals(estabelecimentoId))
          ..orderBy([(i) => OrderingTerm.asc(i.nome)]))
        .watch();
  }

  /// Observa apenas os itens disponíveis (para o garçom montar um pedido).
  Stream<List<ItemCardapio>> watchItensDisponiveis(String estabelecimentoId) {
    return (select(itensCardapio)
          ..where(
            (i) =>
                i.estabelecimentoId.equals(estabelecimentoId) &
                i.disponivel.equals(true),
          )
          ..orderBy([(i) => OrderingTerm.asc(i.nome)]))
        .watch();
  }

  Future<void> inserirCategoria(CategoriasCompanion categoria) =>
      into(categorias).insert(categoria);

  Future<void> atualizarCategoria(Categoria categoria) =>
      update(categorias).replace(categoria);

  Future<void> excluirCategoria(String id) =>
      (delete(categorias)..where((c) => c.id.equals(id))).go();

  Future<void> inserirItem(ItensCardapioCompanion item) =>
      into(itensCardapio).insert(item);

  Future<void> atualizarItem(ItemCardapio item) =>
      update(itensCardapio).replace(item);

  Future<void> excluirItem(String id) =>
      (delete(itensCardapio)..where((i) => i.id.equals(id))).go();
}
