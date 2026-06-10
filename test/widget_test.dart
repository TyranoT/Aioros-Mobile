// Testes de unidade dos enums de domínio e utilitários.

import 'package:aioros_app/core/utils/duracao.dart';
import 'package:aioros_app/core/utils/moeda.dart';
import 'package:aioros_app/features/atendimentos/models/atendimento_status.dart';
import 'package:aioros_app/features/mesas/models/mesa_status.dart';
import 'package:aioros_app/features/pedidos/models/item_pedido_status.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MesaStatus.fromApi', () {
    test('resolve valores e variações', () {
      expect(MesaStatus.fromApi('emAtendimento'), MesaStatus.emAtendimento);
      expect(MesaStatus.fromApi('Em Atendimento'), MesaStatus.emAtendimento);
      expect(MesaStatus.fromApi('disponível'), MesaStatus.disponivel);
    });

    test('lança em valor desconhecido', () {
      expect(() => MesaStatus.fromApi('xpto'), throwsArgumentError);
    });
  });

  group('AtendimentoStatus.fromApi', () {
    test('resolve valores', () {
      expect(AtendimentoStatus.fromApi('aberto'), AtendimentoStatus.aberto);
      expect(
        AtendimentoStatus.fromApi('ENCERRADO'),
        AtendimentoStatus.encerrado,
      );
    });
  });

  group('ItemPedidoStatus', () {
    test('apenas cancelado não conta no total', () {
      expect(ItemPedidoStatus.cancelado.contaNoTotal, isFalse);
      expect(ItemPedidoStatus.entregue.contaNoTotal, isTrue);
      expect(ItemPedidoStatus.pendente.contaNoTotal, isTrue);
    });
  });

  group('formatarCentavos', () {
    test('formata centavos como moeda pt-BR', () {
      expect(formatarCentavos(1290), contains('12,90'));
      expect(formatarCentavos(0), contains('0,00'));
    });
  });

  group('tempoDecorrido', () {
    final base = DateTime(2026, 1, 1, 12);
    test('descreve minutos e horas', () {
      expect(tempoDecorrido(base, agora: base), 'agora');
      expect(
        tempoDecorrido(base, agora: base.add(const Duration(minutes: 5))),
        'há 5 min',
      );
      expect(
        tempoDecorrido(
          base,
          agora: base.add(const Duration(hours: 1, minutes: 20)),
        ),
        'há 1 h 20 min',
      );
    });
  });
}
