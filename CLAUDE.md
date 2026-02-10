# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter mobile application project named "samurai_studios". The project is configured for cross-platform development (iOS and Android) using Flutter SDK 3.10.8+.

## Development Commands

### Running the App
```bash
flutter run                    # Run on connected device/emulator
flutter run -d <device_id>     # Run on specific device
flutter run --release          # Run in release mode
```

### Building
```bash
flutter build apk              # Build Android APK
flutter build appbundle        # Build Android App Bundle
flutter build ios              # Build iOS app (macOS only)
flutter build ipa              # Build iOS archive (macOS only)
```

### Testing
```bash
flutter test                   # Run all tests
flutter test test/widget_test.dart  # Run specific test file
flutter test --coverage        # Run tests with coverage
```

### Code Quality
```bash
flutter analyze                # Run static analysis
flutter pub outdated           # Check for outdated packages
flutter pub upgrade            # Upgrade dependencies
```

### Maintenance
```bash
flutter pub get                # Install dependencies
flutter clean                  # Clean build artifacts
flutter doctor                 # Check Flutter installation
```

## Project Structure

- `lib/` - Main application source code
  - `main.dart` - Application entry point and root widget
- `test/` - Test files (mirrors lib/ structure)
- `android/` - Android-specific native code and configuration
- `ios/` - iOS-specific native code and configuration
- `pubspec.yaml` - Dependency and asset configuration
- `analysis_options.yaml` - Dart linter configuration

## Architecture Notes

### Current Structure
The app currently uses a simple StatefulWidget pattern with local state management. As the app grows, consider:
- Organizing code into feature-based directories (e.g., `lib/features/`, `lib/widgets/`, `lib/models/`)
- Implementing a state management solution when complexity increases (Provider, Riverpod, Bloc, etc.)
- Separating business logic from UI code

### Code Organization Best Practices
- Place reusable widgets in a dedicated `lib/widgets/` directory
- Create separate files for models in `lib/models/`
- Use services or repositories for API calls and data access in `lib/services/`
- Keep utility functions in `lib/utils/`

## Key Conventions

### Dart/Flutter Specifics
- Use `const` constructors wherever possible for performance
- Follow the `flutter_lints` rules defined in `analysis_options.yaml`
- Prefer composition over inheritance for widget reuse
- Use `final` for immutable class fields
- Import order: Dart SDK → Flutter SDK → External packages → Internal files

### State Management
- Currently using `setState()` for local state
- When state needs to be shared across widgets, consider lifting state up or introducing a state management solution

### Testing
- Widget tests should mirror the structure in `lib/`
- Test files should end with `_test.dart`
- Use `testWidgets()` for widget tests and `test()` for unit tests

## Platform-Specific Notes

### Android
- Configuration in `android/app/build.gradle.kts`
- Package name: `com.example.samurai_studios`
- Uses Kotlin Gradle scripts

### iOS
- Configuration in `ios/Runner.xcodeproj/`
- Uses Swift for native code
- App delegate: `ios/Runner/AppDelegate.swift`
