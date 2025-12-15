Oivan Task – Flutter Application

This project is a Flutter application built as a technical task, focusing on clean architecture, 
scalability, and best practices rather than feature overload.

Features

- Users list fetched from StackExchange API
- Pagination with infinite scrolling
- Bookmark users locally using Hive
- Persistent bookmark state across app restarts
- Clean Architecture (Data / Domain / Presentation)
- Riverpod 3 (Notifier-based state management)
- Dio for networking
- GoRouter for navigation
- Centralized theme, colors, and reusable UI components
- Scalable Hive setup (ready for future features)


Architecture Overview

The project follows Clean Architecture principles.

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


Each feature is isolated and follows the same structure:

- Data: API and local storage models
- Domain: Entities and repositories
- Presentation: ViewModels and UI

State Management

- Riverpod 3
- Uses Notifier and NotifierProvider
- ViewModels handle business logic only
- UI is fully reactive and stateless where possible

Local Storage (Hive)

- Bookmarks are stored locally using Hive.
- Design decisions
- Store full user data instead of only user IDs
- Avoid unnecessary API calls
- Faster UI rendering
- Future-ready for offline-friendly behavior
- Storage structure
- HiveManager: App-wide Hive initialization
- HiveBoxProvider: Generic and reusable box handler
- Feature-specific services (e.g. BookmarkHiveService)
- This design prevents box duplication and type conflicts while keeping storage scalable.

UI and Theming

- Centralized AppColors
- Global AppTheme
- Reusable AppAppBar component
- Consistent Material 3 styling

Navigation

- GoRouter
- Clean and well-defined routes
- Easy to extend with new screens

Tech Stack

- Flutter
- Dart
- Riverpod 3
- Dio
- Hive
- GoRouter


 Getting Started
 
