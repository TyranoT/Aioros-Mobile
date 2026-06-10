import 'package:go_router/go_router.dart';

import '../core/database/app_database.dart';
import '../core/session/session_controller.dart';
import '../features/atendimentos/presentation/mesa_detalhe_page.dart';
import '../features/auth/presentation/login_page.dart';
import '../features/mesas/presentation/mesas_page.dart';

/// Prefixos de rota restritos a administradores.
const _rotasAdmin = ['/admin', '/vendas', '/desempenho'];

/// Cria o roteador declarativo do app, com guarda de autenticação.
///
/// - Deslogado → sempre `/login`.
/// - Logado em `/login` → vai para `/mesas`.
/// - Rotas administrativas exigem perfil admin; senão, volta para `/mesas`.
GoRouter criarRouter({
  required SessionController session,
  required AppDatabase db,
}) {
  return GoRouter(
    refreshListenable: session,
    initialLocation: '/mesas',
    redirect: (context, state) {
      final logado = session.autenticado;
      final indoParaLogin = state.matchedLocation == '/login';

      if (!logado) return indoParaLogin ? null : '/login';
      if (indoParaLogin) return '/mesas';

      final ehRotaAdmin = _rotasAdmin.any(state.matchedLocation.startsWith);
      if (ehRotaAdmin && !session.isAdmin) return '/mesas';

      return null;
    },
    routes: [
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(session: session),
      ),
      GoRoute(
        path: '/mesas',
        builder: (context, state) => MesasPage(session: session, db: db),
        routes: [
          GoRoute(
            path: ':id',
            builder: (context, state) => MesaDetalhePage(
              mesaId: state.pathParameters['id']!,
              session: session,
              db: db,
            ),
          ),
        ],
      ),
    ],
  );
}
