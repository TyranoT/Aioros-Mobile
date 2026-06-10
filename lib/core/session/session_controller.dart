import 'package:flutter/foundation.dart';

import '../database/app_database.dart';
import '../utils/senha.dart';
import 'perfil_usuario.dart';

/// Estado de autenticação da aplicação.
///
/// Mantém o usuário logado (garçom ou administrador) e o estabelecimento
/// ativo. Notifica os ouvintes (incl. o `GoRouter`) a cada login/logout.
class SessionController extends ChangeNotifier {
  SessionController(this._db);

  final AppDatabase _db;

  PerfilUsuario? _perfil;
  String? _estabelecimentoId;
  String? _nomeUsuario;
  Garcom? _garcom;

  /// Há um usuário autenticado.
  bool get autenticado => _perfil != null;

  /// Perfil do usuário logado, ou `null` se deslogado.
  PerfilUsuario? get perfil => _perfil;

  /// O usuário logado tem acesso administrativo.
  bool get isAdmin => _perfil?.isAdmin ?? false;

  /// Estabelecimento do usuário logado.
  String? get estabelecimentoId => _estabelecimentoId;

  /// Nome do usuário logado (para saudação na UI).
  String? get nomeUsuario => _nomeUsuario;

  /// Garçom logado, quando o perfil é garçom.
  Garcom? get garcom => _garcom;

  /// Autentica um garçom pelo código. Retorna `false` se o código for inválido.
  Future<bool> loginGarcom(String codigo) async {
    final garcom = await _db.garconsDao.garconPorCodigo(codigo.trim());
    if (garcom == null) return false;

    _garcom = garcom;
    _perfil = PerfilUsuario.garcom;
    _estabelecimentoId = garcom.estabelecimentoId;
    _nomeUsuario = garcom.nome;
    notifyListeners();
    return true;
  }

  /// Autentica um administrador por usuário e senha. Retorna `false` se inválido.
  Future<bool> loginAdmin(String usuario, String senha) async {
    final admin = await _db.adminsDao.adminPorUsuario(usuario.trim());
    if (admin == null || !verificarSenha(senha, admin.senhaHash)) return false;

    _garcom = null;
    _perfil = PerfilUsuario.administrador;
    _estabelecimentoId = admin.estabelecimentoId;
    _nomeUsuario = admin.nome;
    notifyListeners();
    return true;
  }

  /// Encerra a sessão atual.
  void logout() {
    _perfil = null;
    _estabelecimentoId = null;
    _nomeUsuario = null;
    _garcom = null;
    notifyListeners();
  }
}
