# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project

Aioros is a Flutter mobile app for managing restaurant/bar operations: establishments, waiters (garçons), tables (mesas), and table service sessions (atendimentos). User-facing strings and the domain vocabulary are in Brazilian Portuguese — keep that language for UI text, model/field names, and routes.

**Current state:** early scaffolding. The design-system foundation is in place (`lib/core/theme/`) and the first feature folder exists (`lib/features/mesas/`), but no real screens, repositories, services, routing, or API client have been built yet. `lib/main.dart` renders a temporary `_DesignSystemPreviewPage` (a visual smoke test of colors/typography/status badges), and `test/widget_test.dart` tests it. The product described below (in `README.md`) is the intended build — treat the README as the spec.

## Task skills

`.agents/skills/` contains step-by-step Flutter how-to guides (`SKILL.md` each). Consult the relevant one before doing that kind of work — several map directly to this app's unbuilt pieces:

- `flutter-setup-declarative-routing` — `go_router` setup (routing layer is not built yet).
- `flutter-use-http-package` — REST client for the backend endpoints.
- `flutter-implement-json-serialization` — `fromJson`/`toJson` for the domain models.
- `flutter-apply-architecture-best-practices` — UI/Logic/Data layering.
- `flutter-build-responsive-layout`, `flutter-fix-layout-issues` — adaptive layout + overflow fixes.
- `flutter-add-widget-test`, `flutter-add-integration-test`, `flutter-add-widget-preview` — testing & previews.
- `flutter-setup-localization` — `flutter_localizations` + `intl` (note: UI copy stays pt-BR regardless).

## Commands

```bash
flutter pub get                          # install dependencies
flutter run                              # run on the default connected device/emulator
flutter run -d windows|chrome|<deviceId> # target a specific platform
flutter analyze                          # static analysis / lint (flutter_lints rules)
flutter test                             # run all tests
flutter test test/widget_test.dart       # run a single test file
flutter test --name "<substring>"        # run tests whose name matches
dart format .                            # format code
```

Requires Dart SDK `^3.11.5` (see `pubspec.yaml`). Target platforms scaffolded: android, ios, web, windows, macos, linux.

## Intended architecture

The README prescribes the feature-based `lib/` layout to grow into. Follow it when adding code:

```
lib/
├── core/          # cross-cutting (theme, constants, errors)
├── features/      # feature modules
├── models/        # domain models
├── repositories/  # data access
├── services/      # business/integration logic
├── widgets/       # shared widgets
├── pages/         # screens
├── routes/        # navigation
└── main.dart
```

Domain entities and their relationships (all ids are UUIDs): an **Estabelecimento** owns **Garçom** (login by `codigo`, has `ativo` flag) and **Mesa** (has a status enum). An **Atendimento** links one Mesa to one Garçom with open/close timestamps. Table statuses: Disponível, Ocupada, Em Atendimento, Reservada, Limpeza, Indisponível.

The README's top-level `models/`, `repositories/`, `services/`, `pages/`, `routes/` folders are the prescribed *shared* layout, but the code so far organizes by feature: `lib/features/<feature>/{models,widgets,...}` (see `lib/features/mesas/`). Prefer the feature-based layout for feature code; reserve the top-level folders for genuinely cross-feature pieces.

The backend (separate, not in this repo) is REST + Clean Architecture; the README lists the endpoint contracts (`/estabelecimentos`, `/garcons`, `/mesas`, `/atendimentos`, `POST /auth/garcom`) the app consumes.

## Established conventions

- **Design tokens** are namespaced `abstract final class`es with `static const` members, not loose constants — `AppColors`, `AppTypography`, `AppSpacing`, `AppRadius`, `AppShadows` in `lib/core/theme/`. Use these (and `AppTheme.light`) instead of hardcoding colors, sizes, or radii. `aiorosCardDecoration()` in `app_spacing.dart` is the standard card surface.
- **Domain status enums** use Dart enhanced enums carrying their own UI data (`label` in pt-BR, `color`, `icon`) plus API serialization helpers — `apiValue` getter and a robust `fromApi(String)` factory that normalizes case/accents/separators and throws `ArgumentError` on unknown values. `MesaStatus` (`lib/features/mesas/models/mesa_status.dart`) is the reference; follow this shape for `Atendimento`/`Garçom` statuses.
- **Icons** come from `lucide_icons_flutter` (`LucideIcons.*`), not Material `Icons`.

## Design system

- Font: **Inter** via `google_fonts` (weights 700 Bold / 600 SemiBold / 400 Regular). Defined in `AppTypography`.
- Colors: Primary `#2563EB`, Success `#22C55E`, Warning `#F59E0B`, Error `#EF4444`, Background `#F8FAFC`, Surface `#FFFFFF`, Text `#0F172A`. Defined in `AppColors`.
- Material 3, light theme only so far. Cards: 16px radius + soft shadow; buttons: 12px radius, 52px min height.
