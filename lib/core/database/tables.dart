import 'package:drift/drift.dart';

import '../../features/atendimentos/models/atendimento_status.dart';
import '../../features/mesas/models/mesa_status.dart';
import '../../features/pedidos/models/item_pedido_status.dart';

/// Estabelecimento (bar/restaurante) dono de garçons, mesas e cardápio.
@DataClassName('Estabelecimento')
class Estabelecimentos extends Table {
  TextColumn get id => text()();
  TextColumn get nome => text()();
  TextColumn get responsavel => text()();
  DateTimeColumn get criadoEm => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Administrador do estabelecimento (login por usuário + senha).
@DataClassName('Administrador')
class Administradores extends Table {
  TextColumn get id => text()();
  TextColumn get estabelecimentoId =>
      text().references(Estabelecimentos, #id)();
  TextColumn get nome => text()();
  TextColumn get usuario => text().unique()();
  TextColumn get senhaHash => text()();
  DateTimeColumn get criadoEm => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Garçom do estabelecimento (login por código).
@DataClassName('Garcom')
class Garcons extends Table {
  TextColumn get id => text()();
  TextColumn get estabelecimentoId =>
      text().references(Estabelecimentos, #id)();
  TextColumn get nome => text()();
  TextColumn get codigo => text().unique()();
  BoolColumn get ativo => boolean().withDefault(const Constant(true))();
  DateTimeColumn get criadoEm => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Mesa física com número, capacidade (assentos) e status operacional.
@DataClassName('Mesa')
class Mesas extends Table {
  TextColumn get id => text()();
  TextColumn get estabelecimentoId =>
      text().references(Estabelecimentos, #id)();
  IntColumn get numero => integer()();
  IntColumn get capacidade => integer()();
  TextColumn get status => textEnum<MesaStatus>().withDefault(
    Constant(MesaStatus.disponivel.name),
  )();
  TextColumn get observacao => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Categoria do cardápio (ex.: Bebidas, Pratos, Sobremesas).
@DataClassName('Categoria')
class Categorias extends Table {
  TextColumn get id => text()();
  TextColumn get estabelecimentoId =>
      text().references(Estabelecimentos, #id)();
  TextColumn get nome => text()();
  IntColumn get ordem => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Item do cardápio. Preço em centavos para evitar imprecisão de ponto flutuante.
@DataClassName('ItemCardapio')
class ItensCardapio extends Table {
  TextColumn get id => text()();
  TextColumn get estabelecimentoId =>
      text().references(Estabelecimentos, #id)();
  TextColumn get categoriaId => text().references(Categorias, #id)();
  TextColumn get nome => text()();
  TextColumn get descricao => text().nullable()();
  IntColumn get precoCentavos => integer()();
  BoolColumn get disponivel => boolean().withDefault(const Constant(true))();

  @override
  Set<Column> get primaryKey => {id};
}

/// Atendimento: liga uma mesa a um garçom entre abertura e encerramento.
@DataClassName('Atendimento')
class Atendimentos extends Table {
  TextColumn get id => text()();
  TextColumn get mesaId => text().references(Mesas, #id)();
  TextColumn get garcomId => text().references(Garcons, #id)();
  TextColumn get status => textEnum<AtendimentoStatus>().withDefault(
    Constant(AtendimentoStatus.aberto.name),
  )();
  DateTimeColumn get abertura => dateTime()();
  DateTimeColumn get encerramento => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Item pedido dentro de um atendimento.
///
/// `precoUnitarioCentavos` é fotografado no momento do pedido para que mudanças
/// posteriores no cardápio não alterem contas já abertas.
@DataClassName('Pedido')
class Pedidos extends Table {
  TextColumn get id => text()();
  TextColumn get atendimentoId => text().references(Atendimentos, #id)();
  TextColumn get itemCardapioId => text().references(ItensCardapio, #id)();
  IntColumn get quantidade => integer().withDefault(const Constant(1))();
  IntColumn get precoUnitarioCentavos => integer()();
  TextColumn get observacao => text().nullable()();
  TextColumn get status => textEnum<ItemPedidoStatus>().withDefault(
    Constant(ItemPedidoStatus.pendente.name),
  )();
  DateTimeColumn get criadoEm => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
