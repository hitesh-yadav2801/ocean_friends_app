# 🍽️ Ocean Friends — Food Recipes App

A polished Flutter application that lets users **browse, filter, and search meal recipes** using [TheMealDB](https://www.themealdb.com/api.php) public API. The standout feature is **voice-driven search**: speak a category name or a dish keyword, and the app intelligently routes the query to the right API endpoint automatically.

---

## 📸 Screens

| Home | Search | Voice Search |
|------|--------|--------------|
| Category chips, recipe grid, user avatar | Search bar with mic button, result grid | Pulsing indicator, live partial-text, auto-dispatch |

---

## ✨ Features

### Core
- **Browse recipes** — loads a recipe grid filtered by the selected category chip on the home screen
- **Category filter** — horizontal scrollable chip row fetched live from the API; "All" chip triggers a broad keyword search
- **Keyword search** — full-text recipe search via TheMealDB; empty-state and error-state UI handled distinctly
- **Shimmer skeletons** — animated shimmer placeholders shown during every network load (categories, recipes)
- **User profile header** — random avatar + first name fetched from randomuser.me on app launch

### Voice-Driven Search *(Phase 6)*
- **Speech-to-text** — tap the mic button on the search screen to speak; recognised text auto-fills the search field
- **Smart query parser** — spoken text is matched against the live category list:
  - Match found → `filter.php?c=` (category API)
  - No match → `search.php?s=` (keyword API)
- **Live feedback** — pulsing dot + partial transcript displayed while the mic is active
- **Error handling** — permission denied, no speech detected, and device-unavailable states all surface as friendly snack bars

---

## 🏗️ Architecture

The project follows **Clean Architecture** with a strict three-layer separation per feature:

```
lib/
├── core/
│   ├── constants/          # API endpoints, app-wide magic values
│   ├── errors/             # Sealed Failure hierarchy + AppResult<T> alias
│   ├── extensions/         # BuildContext convenience extensions
│   ├── network/            # DioClient + logging & error interceptors
│   ├── presentation/       # Shared widgets (RecipeCard, CategoryChip, AnimatedShimmer)
│   ├── router/             # go_router config + RouteNames constants
│   ├── theme/              # AppColors, AppTextStyles, AppTheme
│   ├── usecase/            # UseCase<T, Params> base interface
│   └── utils/              # AppLogger (structured dev logging)
│
├── di/
│   ├── injection.dart              # GetIt instance + @InjectableInit entry point
│   └── injection.config.dart       # ⚠️ Generated — do not edit manually
│
├── features/
│   ├── home/
│   │   ├── data/           # CategoryModel (freezed), CategoryRemoteDataSource, CategoryRepositoryImpl, UserService
│   │   ├── domain/         # Category entity, CategoryRepository interface, GetCategoriesUseCase
│   │   └── presentation/   # CategoryBloc, UserBloc, HomePage
│   │
│   ├── search/
│   │   ├── data/           # RecipeModel (freezed), RecipeRemoteDataSource, RecipeRepositoryImpl
│   │   ├── domain/         # Recipe entity, RecipeRepository interface, SearchRecipesUseCase,
│   │   │                   # FilterByCategoryUseCase, SmartQueryParser
│   │   └── presentation/   # RecipeListBloc, VoiceSearchCubit, SearchPage
│   │
│   └── recipes/            # Placeholder page (Phase 5 — Recipe Detail, pending)
│
└── shared/
    └── widgets/            # Barrel export for shared widget library
```

### State Management
- **BLoC** for all data-driven features (`CategoryBloc`, `RecipeListBloc`)
- **Cubit** for simpler, lifecycle-bound state (`VoiceSearchCubit`, `UserBloc`)
- All states are **immutable** via `freezed`

### Data Flow
```
UI  →  Event  →  BLoC  →  UseCase  →  Repository  →  DataSource  →  Dio  →  API
                                                              ↓
UI  ←  State  ←  BLoC  ←  Either<Failure, T>  ←────────────────────────────────
```

---

## 🧰 Tech Stack

| Concern | Package | Version |
|---------|---------|---------|
| UI Framework | Flutter | SDK ^3.11.1 |
| State Management | flutter_bloc | ^9.1.1 |
| Dependency Injection | get_it + injectable | ^8.0.3 / ^2.5.0 |
| Navigation | go_router | ^14.6.3 |
| Networking | dio | ^5.8.0+1 |
| Serialization | freezed + json_serializable | ^3.2.5 / ^6.9.4 |
| Responsive sizing | flutter_screenutil | ^5.9.3 |
| Image caching | cached_network_image | ^3.4.1 |
| Error handling | fpdart (Either) | ^1.1.0 |
| Voice input | speech_to_text | ^7.0.0 |
| Shimmer loading | shimmer | ^3.0.0 |
| SVG icons | flutter_svg | ^2.2.4 |
| Fonts | google_fonts (Poppins) | ^8.0.2 |
| Logging | logger | ^2.5.0 |
| Linting | very_good_analysis | ^9.0.0 |

---

## 🚀 Getting Started

### Prerequisites

| Tool | Minimum Version |
|------|----------------|
| Flutter SDK | 3.27.0 |
| Dart SDK | 3.11.1 |
| Xcode (iOS) | 15.0+ |
| Android Studio / SDK | API 21+ |

### Setup

```bash
# 1. Clone the repository
git clone <repo-url>
cd ocean_friends/ocean_friends_app

# 2. Install dependencies
flutter pub get

# 3. Run code generation (freezed + injectable)
dart run build_runner build --delete-conflicting-outputs

# 4. Run the app
flutter run
```

> **Note:** No API key is needed — the app uses TheMealDB's free public tier (key = `1`).

### Running on iOS

Microphone and speech recognition permissions are pre-configured in `ios/Runner/Info.plist`. Accept the permission prompts on first use of voice search.

### Running on Android

`RECORD_AUDIO` is declared in `AndroidManifest.xml`. The OS will request the permission at runtime when the mic button is first tapped.

---

## 📁 Key Files Reference

| File | Purpose |
|------|---------|
| `lib/main.dart` | App entry point, `ScreenUtilInit`, global `MultiBlocProvider` |
| `lib/core/router/app_router.dart` | Route definitions (`/`, `/search`) |
| `lib/core/network/dio_client.dart` | Dio instance with logging + error interceptors |
| `lib/core/errors/failures.dart` | `ServerFailure`, `NetworkFailure`, `ParseFailure`, `EmptyResultFailure`, `CacheFailure` |
| `lib/di/injection.config.dart` | Auto-generated GetIt registrations |
| `lib/features/search/domain/utils/smart_query_parser.dart` | Voice query decision logic |
| `lib/features/search/presentation/cubits/voice_search_cubit.dart` | STT lifecycle manager |

---

## 🔌 API Reference

Base URL: `https://www.themealdb.com/api/json/v1/1`

| Endpoint | Usage |
|----------|-------|
| `GET /categories.php` | Fetch all meal categories |
| `GET /search.php?s=<query>` | Search recipes by keyword |
| `GET /filter.php?c=<category>` | Filter recipes by category name |
