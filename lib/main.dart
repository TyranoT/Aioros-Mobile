import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'core/database/app_database.dart';
import 'core/session/session_controller.dart';
import 'core/theme/app_theme.dart';
import 'routes/app_router.dart';

void main() {
  final database = AppDatabase();
  final session = SessionController(database);
  runApp(AiorosApp(database: database, session: session));
}

/// Raiz do aplicativo Aioros.
///
/// Recebe o banco e a sessão por injeção de dependência manual (sem singletons
/// globais), conforme as convenções do projeto.
class AiorosApp extends StatefulWidget {
  const AiorosApp({super.key, required this.database, required this.session});

  final AppDatabase database;
  final SessionController session;

  @override
  State<AiorosApp> createState() => _AiorosAppState();
}

class _AiorosAppState extends State<AiorosApp> {
  late final GoRouter _router = criarRouter(
    session: widget.session,
    db: widget.database,
  );

  @override
  void dispose() {
    widget.database.close();
    widget.session.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aioros',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      routerConfig: _router,
    );
  }
}
