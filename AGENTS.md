# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 프로젝트 개요

Flutter 기반의 크로스플랫폼 애플리케이션입니다. 로그인 기능이 포함된 기본 앱 구조를 가지고 있습니다.

## 개발 명령어

```bash
# 의존성 설치
flutter pub get

# 앱 실행 (디버그 모드)
flutter run

# 특정 디바이스에서 실행
flutter run -d chrome          # 웹
flutter run -d macos           # macOS
flutter run -d ios             # iOS 시뮬레이터

# 코드 분석 (린트)
flutter analyze

# 테스트 실행
flutter test

# 빌드
flutter build apk              # Android APK
flutter build ios              # iOS
flutter build web              # 웹
flutter build macos            # macOS
```

## 코드 구조

```
lib/
├── main.dart         # 앱 진입점, MaterialApp 설정, 라우팅
├── pages/            # 페이지 위젯
│   └── login_page.dart
└── enums.dart        # 공통 열거형 정의
```

## 아키텍처

- **라우팅**: `main.dart`의 `MaterialApp.routes`에서 Named Routes 방식 사용
- **테마**: Material 3 + `ColorScheme.fromSeed()` 기반
- **페이지 구조**: `lib/pages/` 디렉토리에 페이지별 위젯 분리
- **상태 관리**: 현재 StatefulWidget 기반 로컬 상태 관리

## SDK 버전

- Dart SDK: ^3.8.1
- flutter_lints: ^5.0.0
