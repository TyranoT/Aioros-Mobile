/// Descreve, em pt-BR, o tempo decorrido desde [inicio] até [agora].
///
/// Exemplos: `agora`, `há 5 min`, `há 1 h 20 min`. Usado para mostrar há
/// quanto tempo um pedido foi feito ou a mesa está em atendimento.
String tempoDecorrido(DateTime inicio, {DateTime? agora}) {
  final referencia = agora ?? DateTime.now();
  final duracao = referencia.difference(inicio);

  if (duracao.inMinutes < 1) return 'agora';
  if (duracao.inMinutes < 60) return 'há ${duracao.inMinutes} min';

  final horas = duracao.inHours;
  final minutos = duracao.inMinutes % 60;
  return minutos == 0 ? 'há $horas h' : 'há $horas h $minutos min';
}

/// Formata uma duração como `HH:mm` (ex.: `01:20`), para tempos de permanência.
String formatarDuracao(Duration duracao) {
  final horas = duracao.inHours.toString().padLeft(2, '0');
  final minutos = (duracao.inMinutes % 60).toString().padLeft(2, '0');
  return '$horas:$minutos';
}
