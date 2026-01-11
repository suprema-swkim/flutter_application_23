# 🚀 [MASTER] LLM 인기도 추적 및 비교 플랫폼 PRD

## 1. 프로젝트 개요 (Executive Summary)
### 1.1 목적
AI 개발자와 연구자들이 분산된 정보를 찾아헤매지 않고, **객관적인 데이터(GitHub, 논문, 다운로드 수 등)**를 기반으로 LLM의 실질적인 인기도와 트렌드를 파악하고 비교할 수 있는 웹 플랫폼을 구축한다.

### 1.2 핵심 가치
*   **다각도 분석:** 단순 조회수가 아닌 개발자/학술/실용/커뮤니티 4가지 관점의 상세 스코어 제공
*   **데이터 기반:** API 자동 수집을 통한 실시간성 보장
*   **즉시 비교:** 스펙과 인기도를 1:1로 비교하는 테이블 제공

---

## 2. 핵심 기능 및 로직 (Core Logic & Features)

### 2.1 다각도 인기도 산정 로직 (Merged Logic)
*기존의 단순 합산 방식 대신, Self-Refine 버전의 **4대 카테고리 가중치 시스템**을 채택하여 정교함을 높임.*

#### 📊 인기도 점수 산출 공식 (Total Score: 100점 만점)
사용자가 각 카테고리의 가중치(W)를 커스텀할 수 있으나, 기본값은 아래와 같다.

**1. 개발자 인기도 (Developer Interest) - 가중치 40%**
*   **지표:** GitHub Stars(40%), Forks(20%), Issues/PR 활성도(20%), StackOverflow 태그(20%)
*   **의미:** 개발 생태계에서의 실제 관심도

**2. 실용적 채택도 (Practical Adoption) - 가중치 30%**
*   **지표:** Hugging Face 다운로드(50%), PyPI 다운로드(30%), Docker Pulls(20%)
*   **의미:** 프로덕션 환경에서의 사용 빈도

**3. 학술적 영향력 (Academic Influence) - 가중치 20%**
*   **지표:** 논문 인용 수(60%), 관련 후속 논문 수(20%), 최근 인용 증가율(20%)
*   **의미:** 연구 및 기술적 진보성

**4. 커뮤니티 활성도 (Community Buzz) - 가중치 10%**
*   **지표:** Reddit 게시물 수, Discord 멤버 수, 소셜 언급량
*   **의미:** 대중적 인지도 및 바이럴

---

### 2.2 주요 기능 명세 (Functional Requirements)

#### FR-1. LLM 목록 및 탐색
*   **카드 UI:** 모델명, 개발사, 파라미터 수, **종합 인기도 점수(반지름 차트)** 표시
*   **필터링:**
    *   라이선스 (Apache 2.0, MIT, Proprietary 등)
    *   모델 크기 (<7B, 7B~30B, >30B)
    *   용도 (Coding, Chat, Analysis)
*   **정렬:** 인기도순(Default), 출시일순, 파라미터순

#### FR-2. 상세 페이지 & 시각화
*   **레이더 차트:** 위 2.1의 4가지 지표를 5각형/4각형 레이더 차트로 시각화
*   **트렌드 라인:** 최근 6개월간의 Star/다운로드 수 변화 추이 그래프 (`fl_chart` 활용)
*   **벤치마크:** MMLU, HumanEval 등 주요 성능 지표 테이블

#### FR-3. 비교 (Comparison)
*   최대 5개 모델 선택 가능
*   **비교 항목:**
    *   인기도 세부 점수
    *   Context Window 사이즈
    *   가격 (Input/Output 토큰당)
    *   라이선스 및 상업적 이용 가능 여부

---

## 3. 기술 아키텍처 (Technical Specs)

### 3.1 기술 스택
*   **Frontend:** Flutter Web (반응형 지원)
*   **State Management:** Riverpod
*   **UI/Chart:** `fl_chart` (차트), Material 3 Design
*   **Backend (Optional Phase 1):** Firebase (Serverless) or Python FastAPI
*   **Data Source:** GitHub API, Hugging Face API, Semantic Scholar API

### 3.2 데이터 모델 (Data Schema)
*Meta 버전의 구조에 Self-Refine의 상세 필드를 통합함.*

```dart
class LLM {
  final String id;
  final String name;
  final String developer;
  final TechnicalSpecs specs;
  final PopularityMetrics metrics; // 아래 상세 모델 참조
  final LicenseInfo license;
  // ...
}

class PopularityMetrics {
  // 1. 개발자 지표
  final int githubStars;
  final int githubForks;
  final int stackOverflowTags;
  
  // 2. 실용 지표
  final int huggingFaceDownloads;
  final int pypiDownloads;
  
  // 3. 학술 지표
  final int citationCount;
  final int paperCount;
  
  // 4. 커뮤니티 지표
  final int redditMentions;
  
  // 계산된 최종 점수 (0~100)
  double get totalScore => calculateWeightedScore();
  
  // 각 카테고리별 정규화 점수 (0~100)
  Map<String, double> get categoryScores; 
}
```

### 3.3 API 명세 (Endpoint)
*   `GET /api/v1/llms`: 필터링/정렬된 목록 조회
*   `GET /api/v1/llms/{id}`: 상세 정보 조회
*   `GET /api/v1/llms/{id}/history`: 시계열 데이터(차트용) 조회
*   `POST /api/v1/compare`: 비교할 ID 리스트를 보내면 비교 데이터 반환

---

## 4. UI/UX 요구사항
*   **반응형 전략:**
    *   **Desktop:** 4열 그리드 카드, 사이드바 필터, 비교 테이블 가로 배치
    *   **Mobile:** 1열 리스트, 바텀시트 필터, 비교 시 "기준 모델 vs 대상 모델" 1:1 뷰로 전환
*   **다크 모드:** 시스템 설정 자동 감지 및 토글 지원
*   **Loading:** 데이터 페칭 중 스켈레톤 UI(Skeleton) 적용 필수

---

## 5. 개발 로드맵 (Milestones)

### Phase 1: MVP (핵심 기능) - 2주
*   [ ] Flutter Web 프로젝트 세팅 및 라우팅 구조 잡기
*   [ ] `LLM` 및 `PopularityMetrics` 데이터 모델링
*   [ ] Mock Data를 활용한 메인 목록(Grid) 및 상세 페이지 UI 구현
*   [ ] GitHub API 연동하여 Star 수 실시간 바인딩 테스트

### Phase 2: 로직 및 시각화 - 2주
*   [ ] 4대 인기도 산정 알고리즘(가중치 로직) 구현
*   [ ] `fl_chart`를 활용한 레이더 차트 및 트렌드 그래프 구현
*   [ ] 검색 및 필터링 로직 고도화

### Phase 3: 고도화 - 2주
*   [ ] 비교(Compare) 기능 구현
*   [ ] 나머지 API (HuggingFace, Scholar 등) 연동 또는 크롤러 구축
*   [ ] 배포 및 최적화

---

## 6. 성공 기준 (Acceptance Criteria)
1.  **데이터:** 최소 20개 이상의 Major LLM 데이터가 로드되어야 한다.
2.  **정확성:** GitHub Star 수는 API 호출 시점 기준 오차범위 1% 내여야 한다.
3.  **성능:** 초기 로딩 2초 이내, 리스트 스크롤 시 60fps 유지.
4.  **반응형:** 모바일(360dp)부터 데스크탑(1920dp)까지 레이아웃 깨짐이 없어야 한다.
