# 🍽️ Ocean Friends — Recipes + Fruit Nutrition Tracker

Ocean Friends is a Flutter app with two main experiences powered by a bottom navigation layout:

1. **Recipes** (Home + Search + Voice Search) powered by TheMealDB.
2. **Fruit Nutrition Tracker** (Items + Daily Limits + Cart + Checkout) powered by Fruityvice.

---

## ✨ Current Features

### Navigation
- **Bottom navigation main shell** with two tabs:
  - **Home** (recipes)
  - **Fruit Items** (nutrition/cart flow)

### Recipes Module
- Browse recipes by category chips on Home.
- Search recipes by keyword.
- Voice search with speech-to-text.
- Smart parser picks category filtering vs keyword search.
- Loading/empty/error states for async data.

### Fruit Nutrition Tracker Module
- Fetches all fruits from Fruityvice API.
- Fruit item cards show:
  - Name
  - Family/order/genus metadata
  - Nutrition values: calories, fat, sugar, carbohydrates, protein
- Item action flow:
  - `Add` button initially
  - Converts to quantity controls (`- 1 +`) after adding
- Daily limits page:
  - Editable defaults for calories, fat, sugar, carbs, protein
  - Save updates global nutrition validation limits
- Real-time nutrition tracking:
  - Aggregates cart totals as quantities change
  - Shows a **single snackbar** listing all exceeded nutrients
- Cart page:
  - Adjust quantities inline
  - Shows total nutrition summary
  - Color-codes exceeded nutrients
- Checkout:
  - Checkout button clears cart
  - Shows success confirmation message

---

## 🏗️ Architecture

The project follows **feature-first Clean Architecture** with DI and route-based navigation.

```text
lib/
├── core/
│   ├── constants/
│   ├── errors/
│   ├── network/
│   ├── router/
│   ├── theme/
│   ├── usecase/
│   └── utils/
├── di/
│   ├── injection.dart
│   └── injection.config.dart   # generated
├── features/
│   ├── home/
│   │   └── presentation/pages/
│   │       ├── home_page.dart
│   │       └── main_bottom_navigation_page.dart
│   ├── search/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── nutrition/
│       ├── data/
│       │   ├── datasources/
│       │   ├── models/
│       │   └── repositories/
│       ├── domain/
│       │   ├── entities/
│       │   ├── repositories/
│       │   └── use_cases/
│       └── presentation/
│           ├── cubits/
│           └── pages/
└── shared/
```

### State Management
- **BLoC:** category/recipe listing and search flows.
- **Cubit:** voice search and nutrition tracking (`NutritionTrackerCubit`).

### Data Flow

```text
UI → BLoC/Cubit → UseCase → Repository → DataSource → Dio → API
UI ← State      ← Result<Either<Failure, T>>
```

---

## 🧰 Tech Stack

| Concern | Package |
|---------|---------|
| UI Framework | Flutter |
| State Management | flutter_bloc |
| Dependency Injection | get_it + injectable |
| Navigation | go_router |
| Networking | dio |
| Serialization | freezed + json_serializable |
| Responsive sizing | flutter_screenutil |
| Error handling | fpdart |
| Voice input | speech_to_text |
| Styling | Material 3 + google_fonts |

---

## 🚀 Getting Started

### Prerequisites

| Tool | Minimum Version |
|------|-----------------|
| Flutter SDK | 3.27.0 |
| Dart SDK | 3.11.1 |
| Xcode (iOS) | 15.0+ |
| Android SDK | API 21+ |

### Setup

```bash
# 1) Clone and enter project
git clone <repo-url>
cd ocean_friends/ocean_friends_app

# 2) Install dependencies
flutter pub get

# 3) Generate code (freezed/json/injectable)
dart run build_runner build --delete-conflicting-outputs

# 4) Run
flutter run
```

### Permissions
- Voice search requires microphone/speech permissions:
  - iOS: configured in `ios/Runner/Info.plist`
  - Android: `RECORD_AUDIO` in `AndroidManifest.xml`

---

## 📁 Key Files

| File | Purpose |
|------|---------|
| `lib/main.dart` | App bootstrap + global providers |
| `lib/core/router/app_router.dart` | Splash/home/search/cart/limits routing |
| `lib/core/theme/app_theme.dart` | Global app theme, including bottom navigation theme |
| `lib/features/home/presentation/pages/main_bottom_navigation_page.dart` | Main bottom navigation shell |
| `lib/features/home/presentation/pages/home_page.dart` | Recipes home experience |
| `lib/features/search/presentation/pages/search_page.dart` | Recipe search + voice input |
| `lib/features/nutrition/presentation/pages/items_page.dart` | Fruit list and quantity controls |
| `lib/features/nutrition/presentation/pages/daily_nutrition_requirements_page.dart` | Daily nutrition limit editor |
| `lib/features/nutrition/presentation/pages/cart_page.dart` | Cart totals, limit highlighting, checkout |
| `lib/features/nutrition/presentation/cubits/nutrition_tracker_cubit.dart` | Cart and nutrition aggregation logic |

---

## 🔌 API Reference

### TheMealDB (Recipes)
Base URL: `https://www.themealdb.com/api/json/v1/1`

| Endpoint | Usage |
|----------|-------|
| `GET /categories.php` | Fetch meal categories |
| `GET /search.php?s=<query>` | Search recipes by keyword |
| `GET /filter.php?c=<category>` | Filter recipes by category |

### Fruityvice (Nutrition)

| Endpoint | Usage |
|----------|-------|
| `GET https://www.fruityvice.com/api/fruit/all` | Fetch all fruits with nutrition values |

---

## 📝 Notes

- No API key is required for the current public endpoints used in this project.
- If you add or modify `@freezed`, `@JsonSerializable`, or `@injectable` classes, rerun build_runner.
