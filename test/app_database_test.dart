// Testes dos DAOs do Drift usando um banco em memória (com o seed).

import 'package:aioros_app/core/database/app_database.dart';
import 'package:aioros_app/core/utils/senha.dart';
import 'package:aioros_app/features/mesas/models/mesa_status.dart';
import 'package:aioros_app/features/pedidos/models/item_pedido_status.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  late String estId;

  setUp(() async {
    db = AppDatabase(NativeDatabase.memory());
    final est = await db.estabelecimentoAtual();
    estId = est!.id;
  });

  tearDown(() async => db.close());

  test('seed cria estabelecimento, garçons, mesas e cardápio', () async {
    final mesas = await db.mesasDao.watchMesas(estId).first;
    final categorias = await db.cardapioDao.watchCategorias(estId).first;
    final itens = await db.cardapioDao.watchItensDisponiveis(estId).first;

    expect(mesas, hasLength(8));
    expect(categorias, isNotEmpty);
    expect(itens, isNotEmpty);
  });

  test('login do garçom resolve pelo código do seed', () async {
    final garcom = await db.garconsDao.garconPorCodigo('1001');
    expect(garcom, isNotNull);
    expect(await db.garconsDao.garconPorCodigo('0000'), isNull);
  });

  test('login do admin valida a senha pelo hash', () async {
    final admin = await db.adminsDao.adminPorUsuario('admin');
    expect(admin, isNotNull);
    expect(verificarSenha('admin123', admin!.senhaHash), isTrue);
    expect(verificarSenha('errada', admin.senhaHash), isFalse);
  });

  test('abrir atendimento muda a mesa para Em Atendimento', () async {
    final mesa = (await db.mesasDao.watchMesas(estId).first).first;
    final garcom = await db.garconsDao.garconPorCodigo('1001');

    await db.atendimentosDao.abrir(mesa.id, garcom!.id);

    final atualizada = await db.mesasDao.mesaPorId(mesa.id);
    expect(atualizada!.status, MesaStatus.emAtendimento);
    expect(
      await db.atendimentosDao.atendimentoAbertoDaMesa(mesa.id),
      isNotNull,
    );
  });

  test('total da conta ignora itens cancelados', () async {
    final mesa = (await db.mesasDao.watchMesas(estId).first).first;
    final garcom = await db.garconsDao.garconPorCodigo('1001');
    final atendimentoId = await db.atendimentosDao.abrir(mesa.id, garcom!.id);

    final itens = await db.cardapioDao.watchItensDisponiveis(estId).first;
    await db.pedidosDao.adicionar(
      atendimentoId: atendimentoId,
      item: itens[0],
      quantidade: 2,
    );
    await db.pedidosDao.adicionar(atendimentoId: atendimentoId, item: itens[1]);

    var pedidos = await db.pedidosDao.watchPedidos(atendimentoId).first;
    final totalCheio = pedidos
        .where((p) => p.pedido.status.contaNoTotal)
        .fold<int>(0, (s, p) => s + p.subtotalCentavos);
    expect(totalCheio, itens[0].precoCentavos * 2 + itens[1].precoCentavos);

    await db.pedidosDao.cancelar(pedidos.first.pedido.id);

    pedidos = await db.pedidosDao.watchPedidos(atendimentoId).first;
    final cancelado = pedidos.firstWhere(
      (p) => p.pedido.status == ItemPedidoStatus.cancelado,
    );
    expect(cancelado, isNotNull);
    final totalSemCancelado = pedidos
        .where((p) => p.pedido.status.contaNoTotal)
        .fold<int>(0, (s, p) => s + p.subtotalCentavos);
    expect(totalSemCancelado, itens[1].precoCentavos);
  });

  test('encerrar atendimento envia a mesa para Limpeza', () async {
    final mesa = (await db.mesasDao.watchMesas(estId).first).first;
    final garcom = await db.garconsDao.garconPorCodigo('1001');
    final atendimentoId = await db.atendimentosDao.abrir(mesa.id, garcom!.id);

    await db.atendimentosDao.encerrar(atendimentoId, mesa.id);

    final atualizada = await db.mesasDao.mesaPorId(mesa.id);
    expect(atualizada!.status, MesaStatus.limpeza);
    expect(await db.atendimentosDao.atendimentoAbertoDaMesa(mesa.id), isNull);
  });
}
