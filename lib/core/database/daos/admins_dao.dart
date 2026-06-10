part of '../app_database.dart';

/// Acesso a dados dos administradores.
@DriftAccessor(tables: [Administradores])
class AdminsDao extends DatabaseAccessor<AppDatabase> with _$AdminsDaoMixin {
  AdminsDao(super.db);

  /// Busca um administrador pelo usuário de login (ou `null`).
  Future<Administrador?> adminPorUsuario(String usuario) {
    return (select(
      administradores,
    )..where((a) => a.usuario.equals(usuario))).getSingleOrNull();
  }
}
