<p align="center">
  <img src="assets/icon/icon-vin-checker-v2.png" width="130" height="130" alt="VIN Checker Logo" style="border-radius: 24px; box-shadow: 0 4px 12px rgba(0,0,0,0.15);" />
</p>

<h1 align="center">VIN Checker & Vehicle Decoder</h1>

<p align="center">
  <strong>Fast, accurate, and comprehensive vehicle identification and history application built with Flutter & Clean Architecture.</strong>
</p>

<p align="center">
  <a href="https://flutter.dev"><img src="https://img.shields.io/badge/Flutter-3.x-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter" /></a>
  <a href="https://dart.dev"><img src="https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart" /></a>
  <a href="https://bloclibrary.dev"><img src="https://img.shields.io/badge/State-Bloc%20%2F%20Cubit-blue?style=for-the-badge&logo=bloc" alt="Bloc" /></a>
  <a href="https://github.com/int21hi/VinChecker"><img src="https://img.shields.io/badge/Platform-iOS%20%7C%20Android-green?style=for-the-badge" alt="Platform" /></a>
  <a href="https://github.com/int21hi/VinChecker/blob/master/LICENSE"><img src="https://img.shields.io/badge/License-MIT-yellow?style=for-the-badge" alt="License" /></a>
</p>

---

## 📱 Download the App

Get the official **VIN Checker** application for your device:

<p align="center">
  <a href="https://play.google.com/store/apps/details?id=com.vinchecker.vin.decoder" target="_blank">
    <img src="https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png" width="220" alt="Get it on Google Play" />
  </a>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <a href="https://apps.apple.com/us/app/vin-checker/id6779218213" target="_blank">
    <img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" width="190" alt="Download on the App Store" />
  </a>
</p>

* **Google Play**: [https://play.google.com/store/apps/details?id=com.vinchecker.vin.decoder](https://play.google.com/store/apps/details?id=com.vinchecker.vin.decoder)
* **Apple App Store**: [https://apps.apple.com/us/app/vin-checker/id6779218213](https://apps.apple.com/us/app/vin-checker/id6779218213)

---

## 📖 Overview

**VIN Checker** is a professional mobile application designed to verify, decode, and generate detailed vehicle reports in seconds. Using the official **NHTSA (National Highway Traffic Safety Administration) VPIC API**, the app instantly extracts verified vehicle specifications, manufacturer data, engine details, assembly plant country, and much more from any standard 17-character Vehicle Identification Number (VIN).

Whether you are buying a used car, inspecting a fleet, or managing vehicle inventories, **VIN Checker** provides immediate access to authoritative technical data, offline record keeping, and professional PDF report generation.

---

## ✨ Features

- 🔍 **Strict 17-Character VIN Validation**: Real-time validation adhering to ISO 3779 standards (filters invalid characters `I`, `O`, `Q`, verifies format and check digit).
- ⚡ **Instant NHTSA VPIC API Decoding**: Fetches official technical data, including:
  - **Make, Model, Year, Body Class & Series**
  - **Vehicle Type & Plant Country**
  - **Engine displacement, cylinders, fuel type, transmission, drive type**
  - Full breakdown of raw technical specifications.
- 📄 **Export & Print PDF Vehicle Reports**: One-tap generation of clean, formatted A4 vehicle reports ready for sharing, archiving, or wireless printing.
- 💾 **Offline History with Hive**: Fast local caching of all searched vehicles with search dates and times. View, inspect, or delete records without an active internet connection.
- 🌓 **Dynamic Theme (Light & Dark Mode)**: Seamlessly adapts to system preferences with modern Material 3 typography and palette.
- 💰 **Monetization Integration**: Configured with Google Mobile Ads (Banner, Interstitial, and Rewarded ads) with environment-based test/production ad unit mapping.
- 🧱 **Clean Architecture**: Decoupled, maintainable, and testable codebase separating Domain, Data, and Presentation layers.

---

## 🏗️ Architecture & Project Structure

The project strictly adheres to **Clean Architecture** principles and the **BLoC / Cubit** state management pattern:

```text
lib/
├── core/
│   ├── errors/            # Custom failures and exception handling
│   ├── network/           # Connectivity checking & network utilities
│   ├── theme/             # Light & Dark Material 3 theme configurations
│   ├── utils/             # AdMob service & PDF report export utility
│   └── widgets/           # Global reusable UI components
│
├── features/
│   └── vin/
│       ├── data/
│       │   ├── datasources/   # Remote (Dio + NHTSA API) & Local (Hive Box)
│       │   ├── models/        # Data transfer models & JSON serialization
│       │   └── repositories/  # Repository implementations
│       │
│       ├── domain/
│       │   ├── entities/      # Pure business entities (immutable with Freezed)
│       │   ├── repositories/  # Repository contracts / interfaces
│       │   └── usecases/      # Use cases (DecodeVin, GetHistory, DeleteHistory)
│       │
│       └── presentation/
│           ├── blocs/         # VinSearchCubit & VinHistoryCubit
│           ├── screens/       # Main, Scan, Detail, and History screens
│           └── widgets/       # Feature-specific widgets (Result Cards, Error displays)
│
└── main.dart                  # App entry point, dependency wiring, and MultiBlocProvider
```

---

## 🛠️ Tech Stack & Dependencies

| Dependency | Purpose |
|------------|---------|
| [Flutter](https://flutter.dev) | Cross-platform UI toolkit |
| [flutter_bloc](https://pub.dev/packages/flutter_bloc) | State management via Cubit pattern |
| [dio](https://pub.dev/packages/dio) | HTTP client for reliable REST API communication |
| [hive_flutter](https://pub.dev/packages/hive_flutter) | High-performance, lightweight NoSQL offline database |
| [freezed](https://pub.dev/packages/freezed) & [json_serializable](https://pub.dev/packages/json_serializable) | Code-generation for immutable states and models |
| [pdf](https://pub.dev/packages/pdf) & [printing](https://pub.dev/packages/printing) | Generating and wireless printing of PDF vehicle reports |
| [google_mobile_ads](https://pub.dev/packages/google_mobile_ads) | Monetization via Banner, Interstitial, and Rewarded ads |
| [intl](https://pub.dev/packages/intl) | Date/time and number formatting |

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (`^3.11.5` or higher)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) or [Xcode](https://developer.apple.com/xcode/)
- Git installed on your machine

### Installation

1. **Clone the repository**:
   ```bash
   git clone https://github.com/int21hi/VinChecker.git
   cd VinChecker
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate code (Freezed & JSON serialization)**:
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the application**:
   ```bash
   flutter run
   ```

---

## 📦 Building for Production

### Android

To build an Android App Bundle (AAB) for Google Play:
```bash
flutter build appbundle --release
```

Or to build a standalone APK:
```bash
flutter build apk --release
```

### iOS

To build an iOS release archive for the App Store:
```bash
flutter build ipa --release
```

---

## 🌐 External APIs

Vehicle data is queried from the **NHTSA Vehicle Product Information Catalog and Vehicle Listing (vPIC)** REST API:
- Endpoint: `https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVin/{VIN}?format=json`
- Documentation: [NHTSA VPIC API Specs](https://vpic.nhtsa.dot.gov/api/)

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

<p align="center">
  Developed with ❤️ by <a href="https://github.com/int21hi">int21hi</a>
</p>
