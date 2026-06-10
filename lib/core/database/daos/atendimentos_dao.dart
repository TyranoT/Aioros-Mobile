part of '../app_database.dart';

/// Acesso a dados dos atendimentos (sessões de serviço das mesas).
@DriftAccessor(tables: [Atendimentos, Mesas])
class AtendimentosDao extends DatabaseAccessor<AppDatabase>
    with _$AtendimentosDaoMixin {
  AtendimentosDao(super.db);

  /// Atendimento atualmente aberto de uma mesa (ou `null`).
  Future<Atendimento?> atendimentoAbertoDaMesa(String mesaId) {
    return (select(atendimentos)..where(
          (a) =>
              a.mesaId.equals(mesaId) &
              a.status.equalsValue(AtendimentoStatus.aberto),
        ))
        .getSingleOrNull();
  }

  /// Observa o atendimento aberto de uma mesa, reagindo a aberturas/fechamentos.
  Stream<Atendimento?> watchAtendimentoAberto(String mesaId) {
    return (select(atendimentos)..where(
          (a) =>
              a.mesaId.equals(mesaId) &
              a.status.equalsValue(AtendimentoStatus.aberto),
        ))
        .watchSingleOrNull();
  }

  /// Abre um atendimento e marca a mesa como "Em Atendimento".
  ///
  /// Retorna o id do atendimento criado. As duas escritas ocorrem numa
  /// transação para manter mesa e atendimento consistentes.
  Future<String> abrir(String mesaId, String garcomId) {
    return transaction(() async {
      final id = gerarId();
      await into(atendimentos).insert(
        AtendimentosCompanion.insert(
          id: id,
          mesaId: mesaId,
          garcomId: garcomId,
          abertura: DateTime.now(),
        ),
      );
      await (update(mesas)..where((m) => m.id.equals(mesaId))).write(
        const MesasCompanion(status: Value(MesaStatus.emAtendimento)),
      );
      return id;
    });
  }

  /// Encerra um atendimento (carimba o encerramento) e envia a mesa à limpeza.
  Future<void> encerrar(String atendimentoId, String mesaId) {
    return transaction(() async {
      await (update(
        atendimentos,
      )..where((a) => a.id.equals(atendimentoId))).write(
        AtendimentosCompanion(
          status: const Value(AtendimentoStatus.encerrado),
          encerramento: Value(DateTime.now()),
        ),
      );
      await (update(mesas)..where((m) => m.id.equals(mesaId))).write(
        const MesasCompanion(status: Value(MesaStatus.limpeza)),
      );
    });
  }

  /// Todos os atendimentos encerrados (base para as telas de análise).
  Future<List<Atendimento>> atendimentosEncerrados() {
    return (select(
      atendimentos,
    )..where((a) => a.status.equalsValue(AtendimentoStatus.encerrado))).get();
  }
}
