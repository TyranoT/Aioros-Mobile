import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../../features/atendimentos/models/atendimento_status.dart';
import '../../features/mesas/models/mesa_status.dart';
import '../../features/pedidos/models/item_pedido_status.dart';
import '../utils/id.dart';
import '../utils/senha.dart';
import 'tables.dart';

part 'app_database.g.dart';
part 'daos/mesas_dao.dart';
part 'daos/garcons_dao.dart';
part 'daos/admins_dao.dart';
part 'daos/cardapio_dao.dart';
part 'daos/atendimentos_dao.dart';
part 'daos/pedidos_dao.dart';

/// Banco de dados local (SQLite via Drift) do Aioros.
///
/// Persistência local-first: não há backend. As telas observam `Stream`s dos
/// DAOs para reagir a mudanças automaticamente.
@DriftDatabase(
  tables: [
    Estabelecimentos,
    Administradores,
    Garcons,
    Mesas,
    Categorias,
    ItensCardapio,
    Atendimentos,
    Pedidos,
  ],
  daos: [
    MesasDao,
    GarconsDao,
    AdminsDao,
    CardapioDao,
    AtendimentosDao,
    PedidosDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  /// Abre o banco de produção; em testes, injete `NativeDatabase.memory()`.
  AppDatabase([QueryExecutor? executor])
    : super(executor ?? driftDatabase(name: 'aioros'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) async {
      await m.createAll();
      await _seed();
    },
  );

  /// Estabelecimento ativo (o app opera com um único estabelecimento local).
  Future<Estabelecimento?> estabelecimentoAtual() =>
      (select(estabelecimentos)..limit(1)).getSingleOrNull();

  /// Popula o banco com dados de demonstração na primeira execução.
  Future<void> _seed() async {
    final agora = DateTime.now();
    final estId = gerarId();

    await into(estabelecimentos).insert(
      EstabelecimentosCompanion.insert(
        id: estId,
        nome: 'Aioros Bar & Cozinha',
        responsavel: 'Italo Monteiro',
        criadoEm: agora,
      ),
    );

    await into(administradores).insert(
      AdministradoresCompanion.insert(
        id: gerarId(),
        estabelecimentoId: estId,
        nome: 'Administrador',
        usuario: 'admin',
        senhaHash: hashSenha('admin123'),
        criadoEm: agora,
      ),
    );

    const garconsSeed = [
      ('Ana Souza', '1001'),
      ('Bruno Lima', '1002'),
      ('Carla Dias', '1003'),
    ];
    for (final (nome, codigo) in garconsSeed) {
      await into(garcons).insert(
        GarconsCompanion.insert(
          id: gerarId(),
          estabelecimentoId: estId,
          nome: nome,
          codigo: codigo,
          criadoEm: agora,
        ),
      );
    }

    for (var numero = 1; numero <= 8; numero++) {
      await into(mesas).insert(
        MesasCompanion.insert(
          id: gerarId(),
          estabelecimentoId: estId,
          numero: numero,
          capacidade: numero.isEven ? 4 : 2,
        ),
      );
    }

    const categoriasSeed = ['Bebidas', 'Entradas', 'Pratos', 'Sobremesas'];
    final categoriaIds = <String, String>{};
    for (var i = 0; i < categoriasSeed.length; i++) {
      final id = gerarId();
      categoriaIds[categoriasSeed[i]] = id;
      await into(categorias).insert(
        CategoriasCompanion.insert(
          id: id,
          estabelecimentoId: estId,
          nome: categoriasSeed[i],
          ordem: Value(i),
        ),
      );
    }

    const itensSeed = <(String, String, int)>[
      ('Bebidas', 'Água Mineral 500ml', 500),
      ('Bebidas', 'Refrigerante Lata', 700),
      ('Bebidas', 'Chopp 300ml', 1200),
      ('Bebidas', 'Suco Natural', 1000),
      ('Entradas', 'Porção de Batata Frita', 2500),
      ('Entradas', 'Isca de Frango', 3200),
      ('Pratos', 'Hambúrguer Artesanal', 3800),
      ('Pratos', 'Filé com Fritas', 5900),
      ('Pratos', 'Risoto de Camarão', 6500),
      ('Sobremesas', 'Pudim', 1500),
      ('Sobremesas', 'Petit Gateau', 2200),
    ];
    for (final (categoria, nome, preco) in itensSeed) {
      await into(itensCardapio).insert(
        ItensCardapioCompanion.insert(
          id: gerarId(),
          estabelecimentoId: estId,
          categoriaId: categoriaIds[categoria]!,
          nome: nome,
          precoCentavos: preco,
        ),
      );
    }
  }
}
