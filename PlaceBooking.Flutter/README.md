# makeupapp

Makeup App

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Automatic Json Serializing in Flutter Using Json Annotation

Run:
flutter packages pub run build_runner build --delete-conflicting-outputs
## Mock data

Install : npm install -g json-server
Run: json-server --watch lib/src/data/db.json
Or: json-server --host 0.0.0.0 --watch db.json
Update the API Endpoint to: http://10.0.2.2:3000

## Build release

- Android: flutter build apk --release


## App Config

- iOS map key: ios/Runner/AppDelegate.swift
- Android map key: android/app/src/main/AndroidManifest.xml
