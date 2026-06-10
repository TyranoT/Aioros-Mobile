/// Perfil do usuário autenticado, usado para roteamento e permissões.
enum PerfilUsuario {
  garcom(label: 'Garçom'),
  administrador(label: 'Administrador');

  const PerfilUsuario({required this.label});

  /// Texto exibido na UI (pt-BR).
  final String label;

  /// Indica se o perfil tem acesso às telas administrativas.
  bool get isAdmin => this == PerfilUsuario.administrador;
}
