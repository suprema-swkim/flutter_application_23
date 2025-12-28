# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Build & Development Commands

```bash
# 의존성 설치
flutter pub get

# 앱 실행 (디버그 모드)
flutter run

# 정적 분석 (린트)
flutter analyze

# 테스트 실행
flutter test

# 특정 테스트 파일 실행
flutter test test/widget_test.dart

# 빌드
flutter build apk      # Android APK
flutter build ios      # iOS
flutter build web      # Web
flutter build windows  # Windows
```

## Project Overview

Flutter 3.8.1+ 기반의 기본 스타터 프로젝트입니다.

**현재 아키텍처:**
- 상태 관리: 기본 `StatefulWidget` + `setState()`
- 라우팅: 단일 화면 (라우팅 라이브러리 없음)
- 백엔드 연동: 없음

**진입점:** `lib/main.dart` - `MyApp` (루트 위젯) → `MyHomePage` (카운터 데모)

## Key Configuration

| 파일 | 용도 |
|------|------|
| `pubspec.yaml` | 패키지 및 의존성 선언 |
| `analysis_options.yaml` | Dart 분석기/린트 규칙 (`flutter_lints` 사용) |

## Dependencies

- `cupertino_icons: ^1.0.8` - iOS 스타일 아이콘
- `flutter_lints: ^5.0.0` - 코드 품질 린트 (dev)
