part of '../app_database.dart';

/// Um pedido com os dados do item de cardápio correspondente (resultado de join).
class PedidoComItem {
  PedidoComItem({required this.pedido, required this.item});

  final Pedido pedido;
  final ItemCardapio item;

  /// Subtotal da linha (preço fotografado × quantidade), em centavos.
  int get subtotalCentavos => pedido.precoUnitarioCentavos * pedido.quantidade;
}

/// Acesso a dados dos pedidos (itens lançados em um atendimento).
@DriftAccessor(tables: [Pedidos, ItensCardapio])
class PedidosDao extends DatabaseAccessor<AppDatabase> with _$PedidosDaoMixin {
  PedidosDao(super.db);

  /// Observa os pedidos de um atendimento, já com o item resolvido (join).
  Stream<List<PedidoComItem>> watchPedidos(String atendimentoId) {
    final query =
        select(pedidos).join([
            innerJoin(
              itensCardapio,
              itensCardapio.id.equalsExp(pedidos.itemCardapioId),
            ),
          ])
          ..where(pedidos.atendimentoId.equals(atendimentoId))
          ..orderBy([OrderingTerm.asc(pedidos.criadoEm)]);

    return query.watch().map(
      (rows) => rows
          .map(
            (row) => PedidoComItem(
              pedido: row.readTable(pedidos),
              item: row.readTable(itensCardapio),
            ),
          )
          .toList(),
    );
  }

  /// Lança um item no atendimento, fotografando o preço atual do cardápio.
  Future<void> adicionar({
    required String atendimentoId,
    required ItemCardapio item,
    int quantidade = 1,
    String? observacao,
  }) {
    return into(pedidos).insert(
      PedidosCompanion.insert(
        id: gerarId(),
        atendimentoId: atendimentoId,
        itemCardapioId: item.id,
        precoUnitarioCentavos: item.precoCentavos,
        quantidade: Value(quantidade),
        observacao: Value(observacao),
        criadoEm: DateTime.now(),
      ),
    );
  }

  /// Cancela um item pedido (deixa de contar no total).
  Future<void> cancelar(String pedidoId) {
    return (update(pedidos)..where((p) => p.id.equals(pedidoId))).write(
      const PedidosCompanion(status: Value(ItemPedidoStatus.cancelado)),
    );
  }

  /// Pedidos não cancelados de um conjunto de atendimentos (base para análises).
  Future<List<Pedido>> pedidosValidosDe(List<String> atendimentoIds) {
    if (atendimentoIds.isEmpty) return Future.value(const []);
    return (select(pedidos)..where(
          (p) =>
              p.atendimentoId.isIn(atendimentoIds) &
              p.status.equalsValue(ItemPedidoStatus.cancelado).not(),
        ))
        .get();
  }
}
