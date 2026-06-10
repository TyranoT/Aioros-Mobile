import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/session/perfil_usuario.dart';
import '../../../core/session/session_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_typography.dart';

/// Tela de login com alternância entre Garçom (código) e Administrador
/// (usuário + senha).
///
/// Em caso de sucesso, o `GoRouter` redireciona para `/mesas` automaticamente
/// ao observar a mudança na [SessionController].
class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.session});

  final SessionController session;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PerfilUsuario _perfil = PerfilUsuario.garcom;

  final _codigoController = TextEditingController();
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  bool _carregando = false;
  String? _erro;

  @override
  void dispose() {
    _codigoController.dispose();
    _usuarioController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _selecionarPerfil(PerfilUsuario perfil) {
    if (perfil == _perfil) return;
    setState(() {
      _perfil = perfil;
      _erro = null;
    });
  }

  Future<void> _entrar() async {
    setState(() {
      _carregando = true;
      _erro = null;
    });

    final bool ok;
    if (_perfil == PerfilUsuario.garcom) {
      ok = await widget.session.loginGarcom(_codigoController.text);
    } else {
      ok = await widget.session.loginAdmin(
        _usuarioController.text,
        _senhaController.text,
      );
    }

    if (!mounted) return;
    setState(() {
      _carregando = false;
      _erro = ok
          ? null
          : _perfil == PerfilUsuario.garcom
          ? 'Código inválido ou garçom inativo.'
          : 'Usuário ou senha incorretos.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const _Marca(),
                  const SizedBox(height: AppSpacing.xl),
                  Container(
                    padding: const EdgeInsets.all(AppSpacing.lg),
                    decoration: aiorosCardDecoration(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _SeletorPerfil(
                          perfil: _perfil,
                          onSelecionar: _selecionarPerfil,
                        ),
                        const SizedBox(height: AppSpacing.lg),
                        ..._campos(),
                        if (_erro != null) ...[
                          const SizedBox(height: AppSpacing.md),
                          _MensagemErro(_erro!),
                        ],
                        const SizedBox(height: AppSpacing.lg),
                        FilledButton(
                          onPressed: _carregando ? null : _entrar,
                          child: _carregando
                              ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: AppColors.onPrimary,
                                  ),
                                )
                              : const Text('Entrar'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _campos() {
    if (_perfil == PerfilUsuario.garcom) {
      return [
        TextField(
          controller: _codigoController,
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => _entrar(),
          decoration: const InputDecoration(
            labelText: 'Código do garçom',
            hintText: 'Ex.: 1001',
            prefixIcon: Icon(LucideIcons.idCard),
          ),
        ),
      ];
    }
    return [
      TextField(
        controller: _usuarioController,
        textInputAction: TextInputAction.next,
        decoration: const InputDecoration(
          labelText: 'Usuário',
          prefixIcon: Icon(LucideIcons.user),
        ),
      ),
      const SizedBox(height: AppSpacing.md),
      TextField(
        controller: _senhaController,
        obscureText: true,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _entrar(),
        decoration: const InputDecoration(
          labelText: 'Senha',
          prefixIcon: Icon(LucideIcons.lock),
        ),
      ),
    ];
  }
}

/// Cabeçalho com o nome e a proposta do app.
class _Marca extends StatelessWidget {
  const _Marca();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppSpacing.md),
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: AppRadius.card,
            boxShadow: AppShadows.card,
          ),
          child: const Icon(
            LucideIcons.utensilsCrossed,
            color: AppColors.onPrimary,
            size: 32,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text('Aioros', style: AppTypography.title.copyWith(fontSize: 28)),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Gestão de mesas e atendimentos',
          style: AppTypography.body.copyWith(color: AppColors.textMuted),
        ),
      ],
    );
  }
}

/// Alternância visual entre os perfis de login.
class _SeletorPerfil extends StatelessWidget {
  const _SeletorPerfil({required this.perfil, required this.onSelecionar});

  final PerfilUsuario perfil;
  final ValueChanged<PerfilUsuario> onSelecionar;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xs),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: AppRadius.button,
        border: Border.all(color: AppColors.border),
      ),
      child: Row(
        children: [
          for (final p in PerfilUsuario.values)
            Expanded(
              child: _OpcaoPerfil(
                perfil: p,
                selecionado: p == perfil,
                onTap: () => onSelecionar(p),
              ),
            ),
        ],
      ),
    );
  }
}

class _OpcaoPerfil extends StatelessWidget {
  const _OpcaoPerfil({
    required this.perfil,
    required this.selecionado,
    required this.onTap,
  });

  final PerfilUsuario perfil;
  final bool selecionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final icone = perfil == PerfilUsuario.garcom
        ? LucideIcons.conciergeBell
        : LucideIcons.shieldCheck;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          color: selecionado ? AppColors.surface : Colors.transparent,
          borderRadius: AppRadius.button,
          boxShadow: selecionado ? AppShadows.subtle : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icone,
              size: 16,
              color: selecionado ? AppColors.primary : AppColors.textMuted,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              perfil.label,
              style: AppTypography.button.copyWith(
                color: selecionado ? AppColors.primary : AppColors.textMuted,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MensagemErro extends StatelessWidget {
  const _MensagemErro(this.mensagem);

  final String mensagem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.error.withValues(alpha: 0.1),
        borderRadius: AppRadius.button,
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.circleAlert, size: 16, color: AppColors.error),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: Text(
              mensagem,
              style: AppTypography.body.copyWith(color: AppColors.error),
            ),
          ),
        ],
      ),
    );
  }
}
