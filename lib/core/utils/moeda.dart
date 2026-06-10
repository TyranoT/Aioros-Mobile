import 'package:intl/intl.dart';

/// Formatador de moeda brasileira (R$) a partir de valores em centavos.
final NumberFormat _formatoReal = NumberFormat.currency(
  locale: 'pt_BR',
  symbol: r'R$',
);

/// Converte um valor em centavos para texto monetário pt-BR.
///
/// Exemplo: `1290` → `R$ 12,90`.
String formatarCentavos(int centavos) => _formatoReal.format(centavos / 100);
