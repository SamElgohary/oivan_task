📱 Oivan Task – Flutter Application

This project is a Flutter application built as a technical task, focusing on clean architecture, scalability, and best practices rather than feature overload.

✨ Features

✅ Users list fetched from StackExchange API
✅ Pagination with infinite scrolling
✅ Bookmark users locally using Hive
✅ Persistent bookmark state across app restarts
✅ Clean Architecture (Data / Domain / Presentation)
✅ Riverpod 3 (Notifier-based state management)
✅ Dio for networking
✅ GoRouter for navigation
✅ Centralized theme, colors, and UI components
✅ Scalable Hive setup (ready for future features)

🧱 Architecture Overview

The project follows Clean Architecture principles:

lib/
├── core/
│   ├── di/            # Dependency injection
│   ├── network/       # API & Dio setup
│   ├── router/        # App navigation (GoRouter)
│   ├── storage/       # Hive manager & box provider
│   ├── theme/         # App colors & theme
│   └── widgets/       # Shared UI components
│
├── features/
│   ├── users/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   │
│   └── bookmarks/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── app.dart
└── main.dart



Each feature is isolated and follows:

Data → API / Local storage models

Domain → Entities & repositories

Presentation → ViewModels & UI

🧠 State Management

Riverpod 3

Uses Notifier and NotifierProvider

ViewModels handle business logic only

UI is fully reactive and stateless where possible

💾 Local Storage (Hive)

Bookmarks are stored locally using Hive.

Design decisions:

Store full user data instead of only user IDs

Avoid unnecessary API calls

Faster UI rendering

Future-ready for offline-friendly behavior

Storage structure:

HiveManager → App-wide initialization

HiveBoxProvider → Generic, reusable box handler

Feature-specific services (e.g. BookmarkHiveService)

This prevents box duplication and type conflicts.

🎨 UI & Theming

Centralized AppColors

Global AppTheme

Reusable AppAppBar

Consistent Material 3 styling

🚦 Navigation

GoRouter

Bootstrap (splash) screen on app start

Clean route definitions

Easy to extend with new screens

🔧 Tech Stack

Flutter

Dart

Riverpod 3

Dio

Hive

GoRouter

📌 Notes & Decisions

User details screen was not implemented as it was not part of the requirements.

Focus was on architecture quality, stability, and scalability.

API rate limiting (HTTP 429) was handled by minimizing unnecessary requests.

▶️ Getting Started
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run

👨‍💻 Author

Developed as part of a technical evaluation task, with emphasis on clean code, maintainability, and real-world architecture practices.
