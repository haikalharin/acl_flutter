# acl

A new Flutter project.

## Getting Started

Data Flow
1. View -> PageEvent -> Bloc -> Repository -> Network/Sqlite or Both -> Bloc -> PageState -> View
2. View -> PageEvent -> Bloc -> Repository -> Network/Sqlite or Both -> Bloc -> PageState -> Future -> Vie

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

flutter packages pub run build_runner build --delete-conflicting-outputs

To build apk or appbundle(to publish to the playstore) for each flavor you can use the commands(recommended) instead of using android studio.
For prod you can use:
APK
flutter build apk --flavor production -t lib/main_prod.dart
flutter build apk --release --flavor production -t lib/main_prod.dart
App Bundle
flutter build appbundle --flavor production -t lib/main_prod.dart
and for dev
APK
flutter build apk --flavor development -t lib/main_dev.dart
flutter build apk --release --flavor development -t lib/main_dev.dart
App Bundle
flutter build appbundle --flavor development -t lib/main_dev.dart

IPA
flutter build ipa --flavor prod -t lib/main_prod.dart
flutter build ipa --release --flavor prod -t lib/main_prod.dart
App Bundle
flutter build appbundle --flavor prod -t lib/main_prod.dart
and for dev
IPA
flutter build ipa --flavor dev -t lib/main_dev.dart
flutter build ipa --release --flavor dev -t lib/main_dev.dart
App Bundle
flutter build appbundle --flavor dev -t lib/main_dev.dart