# LLM 인기도 웹사이트 PRD (통합 최적화 버전)

## 📋 문서 정보
- **버전**: 1.0.0
- **작성일**: 2026-01-11
- **작성 방식**: 6가지 PRD 방식의 장점 통합
- **플랫폼**: Flutter Web

---

## 1. Executive Summary (요약)

### 1.1 프로덕트 개요
LLM(Large Language Model)의 종류와 **다차원 인기도 지표**를 시각화하고 비교할 수 있는 웹 애플리케이션입니다. 개발자들이 다양한 LLM을 탐색하고, 객관적인 인기도 지표를 비교하며, 프로젝트에 적합한 LLM을 선택할 수 있도록 돕는 정보 플랫폼입니다.

### 1.2 핵심 가치 제안
| 가치 | 설명 |
|------|------|
| **중앙화된 정보** | 다양한 LLM 정보를 한 곳에서 확인 |
| **다차원 인기도** | 단일 지표가 아닌 4가지 카테고리의 종합 인기도 |
| **커스터마이징** | 사용자가 가중치를 조절하여 개인화된 인기도 계산 |
| **실시간 트렌드** | API 기반 최신 데이터 제공 |

### 1.3 성공 목표
- 개발자들의 LLM 선택 시간 **50% 단축**
- 월간 활성 사용자 **10,000명** 달성 (6개월 내)
- 사용자 만족도 **4.5/5.0** 이상
- 페이지 로딩 시간 **2초 이내**

### 1.4 기술 전략 결정 (Tree of Thoughts 분석)

#### 검토한 3가지 전략
| 전략 | 초기 비용 | 월 운영비 | 개발 기간 | 채택 |
|------|----------|----------|----------|------|
| 정적 데이터 기반 | $2,000-4,000 | $250-500 | 1-2주 | ❌ |
| 동적 API 기반 | $10,000-20,000 | $1,000-2,000 | 3-4개월 | ❌ |
| **하이브리드** | $4,000-8,000 | $250-760 | 1-2개월 | ✅ |

#### 하이브리드 방식 선택 이유
1. **비용 효율성**: 동적 방식의 1/4 비용
2. **자동화**: GitHub Actions로 무료 자동 업데이트
3. **확장성**: 새로운 데이터 소스 추가 용이
4. **빠른 로딩**: 정적 파일 기반으로 CDN 활용 가능

---

## 2. Problem Statement (문제 정의)

### 2.1 해결하려는 문제
현재 개발자들이 LLM 선택 시 겪는 어려움:

| 문제 | 상세 |
|------|------|
| **정보 분산** | GitHub, 논문 사이트, 블로그 등에 분산 |
| **주관적 평가** | 객관적 데이터 없이 주관적 리뷰에 의존 |
| **비교 어려움** | 여러 LLM을 동시에 비교하기 어려움 |
| **인기도 모호성** | "인기도"의 정의와 측정 방법이 불명확 |

### 2.2 기존 서비스의 한계점
- Hugging Face: 다운로드 수만 제공
- Papers with Code: 학술 지표만 제공
- 통합된 다차원 인기도 지표 서비스 부재

---

## 3. Target Users (타겟 사용자)

### 3.1 사용자 페르소나

#### 페르소나 1: 주니어 개발자 "김개발"
- **나이**: 25-30세
- **역할**: 풀스택 개발자
- **목표**: 프로젝트에 적합한 LLM을 빠르게 찾고 싶음
- **페인 포인트**: 어떤 LLM이 좋은지 모르고, 정보를 찾기 어려움
- **사용 빈도**: 주 1-2회

#### 페르소나 2: 시니어 개발자 "박아키텍트"
- **나이**: 30-40세
- **역할**: 기술 리더/아키텍트
- **목표**: 여러 LLM을 객관적으로 비교하여 최적의 선택
- **페인 포인트**: 여러 소스를 방문하며 비교하는데 시간이 많이 걸림
- **사용 빈도**: 월 2-3회

#### 페르소나 3: AI 연구자 "이연구"
- **나이**: 25-35세
- **역할**: AI/ML 연구자
- **목표**: 최신 LLM 트렌드와 학술적 영향력 파악
- **페인 포인트**: 논문 인용 수와 실제 사용량의 관계 파악 어려움
- **사용 빈도**: 주 1회

### 3.2 사용자 여정 (User Journey)

```
[인지] "프로젝트에 LLM이 필요한데 어떤 걸 써야 하지?"
    ↓
[방문] 웹사이트 접속
    ↓
[탐색] LLM 목록 스크롤 / 검색
    ↓
[필터링] 용도, 라이선스, 모델 크기로 필터
    ↓
[상세 확인] 관심 있는 LLM 상세 정보 확인
    ↓
[비교] 2-5개 LLM 선택하여 비교
    ↓
[의사결정] 인기도와 특징 기반 최종 선택
```

---

## 4. Features & Requirements (기능 및 요구사항)

### 4.1 기능 우선순위 매트릭스

| 기능 | 우선순위 | 복잡도 | 비즈니스 가치 | Phase |
|------|---------|--------|--------------|-------|
| LLM 목록 표시 | **P0** | 낮음 | 높음 | 1 |
| 검색 기능 | **P0** | 낮음 | 높음 | 1 |
| 인기도 지표 표시 | **P0** | 중간 | 높음 | 1 |
| LLM 상세 페이지 | **P0** | 중간 | 높음 | 1 |
| 필터링 | **P1** | 중간 | 중간 | 2 |
| 정렬 | **P1** | 낮음 | 중간 | 2 |
| 비교 기능 | **P1** | 높음 | 중간 | 2 |
| 인기도 그래프 | **P1** | 중간 | 중간 | 2 |
| 대시보드 | **P2** | 높음 | 낮음 | 3 |
| 즐겨찾기 | **P2** | 낮음 | 낮음 | 3 |
| 다크 모드 | **P2** | 낮음 | 낮음 | 3 |
| 다국어 지원 | **P3** | 중간 | 낮음 | 4 |

---

### 4.2 Feature 1: LLM 목록 표시

#### 기능 설명
메인 페이지에서 LLM 목록을 카드 형태로 표시합니다.

#### 우선순위: **P0 (Must Have)**

#### 기능적 요구사항

**FR-1.1: LLM 카드 표시**
- 각 LLM은 카드 형태로 표시
- 카드 포함 정보:
  - LLM 이름
  - 개발사/조직명
  - 짧은 설명 (최대 100자)
  - 주요 인기도 지표 (종합 점수, GitHub Stars)
  - LLM 타입 배지 (오픈소스/상용)
  - 로고 이미지
  - 트렌드 아이콘 (↑↓→)
- 카드 클릭 시 상세 페이지로 이동

**FR-1.2: 그리드 레이아웃**
- 반응형 그리드:
  - Desktop (>1024px): 3-4열
  - Tablet (768px-1024px): 2열
  - Mobile (<768px): 1열

**FR-1.3: 페이지네이션**
- 한 페이지당 20개 LLM 표시
- 무한 스크롤 또는 페이지 번호 방식 선택 가능
- 총 LLM 수 표시

**FR-1.4: 로딩 상태**
- 데이터 로딩 중 스켈레톤 UI 표시
- 에러 발생 시 재시도 버튼 제공

#### 비기능적 요구사항

**NFR-1.1: 성능**
- 초기 로딩 시간: **2초 이내**
- First Contentful Paint (FCP): **< 1.5초**
- Largest Contentful Paint (LCP): **< 2.5초**
- Cumulative Layout Shift (CLS): **< 0.1**
- 카드 렌더링: **60fps 유지**

**NFR-1.2: 접근성**
- WCAG 2.1 AA 수준 준수
- 키보드 네비게이션 지원
- 스크린 리더 호환

#### 사용자 스토리
```
As a 개발자,
I want to LLM 목록을 카드 형태로 한눈에 볼 수 있도록,
So that 빠르게 관심 있는 LLM을 찾을 수 있다.
```

#### 수용 기준 (Acceptance Criteria)
- [ ] LLM 목록이 카드 형태로 표시됨
- [ ] 각 카드에 필수 정보(이름, 개발사, 설명, 인기도)가 모두 표시됨
- [ ] 카드 클릭 시 상세 페이지로 이동함
- [ ] 반응형 레이아웃이 모든 화면 크기에서 작동함
- [ ] 스켈레톤 UI가 로딩 중 표시됨
- [ ] 에러 발생 시 사용자 친화적 메시지와 재시도 버튼이 표시됨

---

### 4.3 Feature 2: 다차원 인기도 지표 시스템 ⭐ (핵심 기능)

#### 기능 설명
"인기도"를 단일 숫자가 아닌 **4가지 카테고리**로 분리하여 제공합니다.

#### 우선순위: **P0 (Must Have)**

#### 4.3.1 인기도 카테고리 정의

**A. 개발자 커뮤니티 인기도 (Developer Community Popularity)**

| 지표 | 가중치 | 데이터 소스 | 업데이트 주기 |
|------|--------|-------------|--------------|
| GitHub Stars 수 | 40% | GitHub API | 일일 |
| GitHub Forks 수 | 20% | GitHub API | 일일 |
| Issues/PR 활동도 | 20% | GitHub API | 일일 |
| Stack Overflow 태그 | 20% | SO API | 주간 |

**의미**: 실제 개발자들의 관심도와 사용량

---

**B. 학술적 영향력 (Academic Influence)**

| 지표 | 가중치 | 데이터 소스 | 업데이트 주기 |
|------|--------|-------------|--------------|
| 논문 인용 수 | 60% | Semantic Scholar | 주간 |
| 관련 논문 수 | 20% | Semantic Scholar | 주간 |
| 최근 1년 인용 증가율 | 20% | 계산 | 주간 |

**의미**: 학술 커뮤니티에서의 영향력

---

**C. 실용적 채택도 (Practical Adoption)**

| 지표 | 가중치 | 데이터 소스 | 업데이트 주기 |
|------|--------|-------------|--------------|
| Hugging Face 다운로드 | 50% | HF API | 일일 |
| PyPI/패키지 다운로드 | 30% | PyPI API | 주간 |
| Docker Hub Pulls | 20% | Docker API | 주간 |

**의미**: 실제 프로덕션 환경에서의 사용 빈도

---

**D. 커뮤니티 활성도 (Community Activity)**

| 지표 | 가중치 | 데이터 소스 | 업데이트 주기 |
|------|--------|-------------|--------------|
| Reddit 게시물 수 | 30% | Reddit API | 주간 |
| Discord/포럼 멤버 수 | 30% | 수동 | 월간 |
| 최근 30일 활동 증가율 | 40% | 계산 | 주간 |

**의미**: 커뮤니티의 활발한 토론 및 지원

---

#### 4.3.2 통합 인기도 점수 계산

**기본 공식:**
```
통합 인기도 = (개발자 인기도 × W1) + (학술적 영향력 × W2) + 
              (실용적 채택도 × W3) + (커뮤니티 활성도 × W4)
```

**기본 가중치:**
| 카테고리 | 가중치 | 이유 |
|----------|--------|------|
| W1 (개발자) | 0.4 | 개발자 타겟이므로 가장 높음 |
| W2 (학술) | 0.2 | 신뢰성 지표 |
| W3 (채택도) | 0.3 | 실제 사용량 반영 |
| W4 (커뮤니티) | 0.1 | 보조 지표 |

**사용자 커스터마이징:**
- 슬라이더 UI로 각 카테고리 가중치 조절 가능
- 프리셋 제공: "개발자 중심", "연구자 중심", "실용 중심"

#### 4.3.3 정규화 및 스케일링

모든 지표는 **0-100 점수**로 정규화:

```dart
double normalize(double value, double maxValue) {
  if (maxValue == 0) return 0;
  return (value / maxValue) * 100;
}
```

**예외 처리:**
| 상황 | 처리 방법 |
|------|----------|
| 데이터 없음 | 해당 지표 제외, 가중치 재분배 |
| API 오류 | 마지막 캐시된 데이터 사용 |
| 이상치 | 상위 1% 이상은 100으로 처리 |

#### 4.3.4 계산 예시: GPT-4

```
[개발자 커뮤니티 인기도]
- GitHub Stars: N/A (폐쇄형)
- 계산: 데이터 없음으로 제외, 가중치 재분배

[학술적 영향력]
- 논문 인용: 15,000회 → 정규화: 95점
- 관련 논문: 500편 → 정규화: 85점
- 최근 1년 증가율: 300% → 정규화: 90점
- 계산: (95×0.6) + (85×0.2) + (90×0.2) = 92점

[실용적 채택도]
- API 사용량 (추정): 높음 → 정규화: 95점
- 계산: 95점

[커뮤니티 활성도]
- Reddit 게시물: 50,000개 → 정규화: 95점
- Discord 멤버: N/A
- 최근 30일 증가율: 30% → 정규화: 70점
- 계산: (95×0.3) + (0×0.3) + (70×0.4) = 56.5점 (불완전 데이터)

[통합 인기도] (개발자 데이터 없으므로 재분배)
- 재분배 가중치: W2=0.35, W3=0.5, W4=0.15
- (92×0.35) + (95×0.5) + (56.5×0.15) = 88.2점
```

#### 기능적 요구사항

**FR-2.1: 인기도 수집**
- 4개 카테고리의 모든 지표 데이터 수집
- GitHub Actions로 주기적 자동 수집
- JSON 파일로 저장

**FR-2.2: 인기도 표시**
- 각 LLM 카드에 종합 점수 표시 (0-100)
- 상세 페이지에서 4개 카테고리 레이더 차트 표시
- 트렌드 화살표 (↑↓→) 표시

**FR-2.3: 가중치 커스터마이징**
- 설정 페이지에서 슬라이더로 가중치 조절
- 프리셋 선택 기능
- 설정은 로컬 스토리지에 저장

#### 수용 기준 (Acceptance Criteria)
- [ ] 4개 카테고리의 인기도 점수가 계산됨
- [ ] 종합 인기도 점수가 0-100 범위로 표시됨
- [ ] 레이더 차트로 4개 카테고리가 시각화됨
- [ ] 가중치 커스터마이징이 작동함
- [ ] 데이터 없는 경우 예외 처리가 정상 작동함
- [ ] 인기도 계산 공식이 예시와 일치함

---

### 4.4 Feature 3: 검색 및 필터링

#### 우선순위: 검색 **P0**, 필터링 **P1**

#### 기능적 요구사항

**FR-3.1: 검색 기능**
- 실시간 검색 (Debounce 300ms 적용)
- 검색 대상: LLM 이름, 개발사, 설명, 태그
- 검색어 하이라이트
- 검색 히스토리 저장 (최근 10개)

**FR-3.2: 필터링 옵션**
| 필터 | 옵션 |
|------|------|
| 라이선스 | 오픈소스, 상용, 제한적 |
| 모델 크기 | Small(<1B), Medium(1B-10B), Large(10B-100B), XL(100B+) |
| 용도 | 챗봇, 코드 생성, 번역, 요약, 멀티모달 |
| 출시일 | 최근 1개월, 3개월, 6개월, 1년, 전체 |
| 인기도 범위 | 슬라이더 (0-100) |

**FR-3.3: 정렬 옵션**
- 종합 인기도순 (기본값)
- 개발자 인기도순
- 학술적 영향력순
- 실용적 채택도순
- 최신순
- 이름순

#### 수용 기준 (Acceptance Criteria)
- [ ] 검색어 입력 시 300ms 후 결과 업데이트
- [ ] 모든 필터 옵션이 정상 작동
- [ ] 여러 필터 동시 적용 가능
- [ ] 필터 상태가 URL에 저장되어 공유 가능
- [ ] 필터 초기화 버튼 작동

---

### 4.5 Feature 4: LLM 상세 페이지

#### 우선순위: **P0 (Must Have)**

#### 기능적 요구사항

**FR-4.1: 기본 정보 표시**
- 모델 이름, 개발사, 출시일
- 상세 설명
- 기술 사양 (파라미터 수, 컨텍스트 길이, 아키텍처)
- 라이선스 정보
- 공식 링크 (웹사이트, GitHub, 논문)

**FR-4.2: 인기도 대시보드**
- 레이더 차트 (4개 카테고리)
- 각 지표 상세 점수 표
- 시간별 트렌드 라인 차트 (최근 6개월)

**FR-4.3: 관련 모델 추천**
- 유사한 모델 3-5개 추천
- 추천 기준: 같은 개발사, 비슷한 용도, 비슷한 크기

#### 수용 기준 (Acceptance Criteria)
- [ ] 모든 기본 정보가 표시됨
- [ ] 레이더 차트가 정상 렌더링됨
- [ ] 트렌드 차트가 6개월 데이터로 표시됨
- [ ] 관련 모델이 추천됨
- [ ] 공유 버튼으로 URL 복사 가능

---

### 4.6 Feature 5: 비교 기능

#### 우선순위: **P1 (Should Have)**

#### 기능적 요구사항

**FR-5.1: 비교 목록 관리**
- LLM 카드에서 "비교에 추가" 버튼
- 최대 5개까지 선택 가능
- 비교 목록은 화면 하단에 플로팅 바로 표시

**FR-5.2: 비교 테이블**
- 선택된 LLM들을 나란히 비교
- 비교 항목:
  - 기본 정보
  - 4개 카테고리 인기도 점수
  - 기술 사양
  - 라이선스
- 높은 값은 녹색, 낮은 값은 회색으로 강조

**FR-5.3: 비교 결과 내보내기**
- 이미지로 내보내기 (PNG)
- CSV로 내보내기
- 비교 URL 공유

#### 수용 기준 (Acceptance Criteria)
- [ ] 최대 5개까지 비교 목록에 추가 가능
- [ ] 비교 테이블이 정확하게 표시됨
- [ ] 값 비교 색상 강조가 작동함
- [ ] 내보내기 기능이 작동함
- [ ] 모바일에서 세로 비교 형태로 표시됨

---

## 5. Technical Requirements (기술 요구사항)

### 5.1 기술 스택

#### 프론트엔드 (Flutter Web)
| 카테고리 | 패키지 | 버전 | 용도 |
|----------|--------|------|------|
| 상태 관리 | `flutter_riverpod` | ^2.4.0 | 전역 상태 관리 |
| HTTP 클라이언트 | `dio` | ^5.3.0 | API 통신 |
| 차트 | `fl_chart` | ^0.65.0 | 인기도 시각화 |
| 로컬 스토리지 | `shared_preferences` | ^2.2.0 | 설정 저장 |
| 라우팅 | `go_router` | ^12.0.0 | 네비게이션 |
| 이미지 캐싱 | `cached_network_image` | ^3.3.0 | 로고 이미지 |
| JSON 직렬화 | `json_annotation` | ^4.8.0 | 데이터 모델 |

#### pubspec.yaml 의존성
```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_riverpod: ^2.4.0
  dio: ^5.3.0
  fl_chart: ^0.65.0
  shared_preferences: ^2.2.0
  go_router: ^12.0.0
  cached_network_image: ^3.3.0
  json_annotation: ^4.8.0
  intl: ^0.18.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  build_runner: ^2.4.0
  json_serializable: ^6.7.0
  flutter_lints: ^3.0.0
```

#### 데이터 수집 (Python)
| 용도 | 패키지 |
|------|--------|
| HTTP 요청 | `requests` |
| 데이터 처리 | `pandas` |
| JSON 처리 | `json` (내장) |
| 스케줄링 | GitHub Actions |

### 5.2 아키텍처 개요

```
┌─────────────────────────────────────────────────────────┐
│                     Flutter Web App                      │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────┐     │
│  │   Screens   │  │   Widgets   │  │   Charts    │     │
│  └──────┬──────┘  └──────┬──────┘  └──────┬──────┘     │
│         │                │                │             │
│  ┌──────▼────────────────▼────────────────▼──────┐     │
│  │              Riverpod Providers               │     │
│  │  (llmListProvider, popularityProvider, etc.)  │     │
│  └──────────────────────┬────────────────────────┘     │
│                         │                               │
│  ┌──────────────────────▼────────────────────────┐     │
│  │              Repository Layer                  │     │
│  │  (LLMRepository, PopularityRepository)        │     │
│  └──────────────────────┬────────────────────────┘     │
│                         │                               │
│  ┌──────────────────────▼────────────────────────┐     │
│  │              Data Sources                      │     │
│  │  (Local JSON / Remote API)                    │     │
│  └───────────────────────────────────────────────┘     │
└─────────────────────────────────────────────────────────┘
                          │
                          │ HTTP (JSON)
                          ▼
┌─────────────────────────────────────────────────────────┐
│              Static JSON Files (GitHub)                  │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐           │
│  │ llms.json │  │metrics.json│  │trends.json│           │
│  └───────────┘  └───────────┘  └───────────┘           │
└─────────────────────────────────────────────────────────┘
                          ▲
                          │ GitHub Actions (Daily)
                          │
┌─────────────────────────────────────────────────────────┐
│              Python Data Collector                       │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐           │
│  │GitHub API │  │  HF API   │  │Scholar API│           │
│  └───────────┘  └───────────┘  └───────────┘           │
└─────────────────────────────────────────────────────────┘
```

### 5.3 데이터 모델

```dart
// lib/models/llm_model.dart

import 'package:json_annotation/json_annotation.dart';

part 'llm_model.g.dart';

@JsonSerializable()
class LLMModel {
  final String id;
  final String name;
  final String developer;
  final DateTime releaseDate;
  final String description;
  final String? logoUrl;
  final LLMType type;
  final String license;
  final TechnicalSpecs specs;
  final PopularityMetrics popularity;
  final List<String> tags;
  final List<String> useCases;
  final ExternalLinks links;
  final DateTime updatedAt;

  const LLMModel({
    required this.id,
    required this.name,
    required this.developer,
    required this.releaseDate,
    required this.description,
    this.logoUrl,
    required this.type,
    required this.license,
    required this.specs,
    required this.popularity,
    required this.tags,
    required this.useCases,
    required this.links,
    required this.updatedAt,
  });

  factory LLMModel.fromJson(Map<String, dynamic> json) => 
      _$LLMModelFromJson(json);
  Map<String, dynamic> toJson() => _$LLMModelToJson(this);
}

enum LLMType {
  @JsonValue('open_source')
  openSource,
  @JsonValue('commercial')
  commercial,
  @JsonValue('restricted')
  restricted,
}

@JsonSerializable()
class TechnicalSpecs {
  final int? parameterCount; // in billions
  final int? contextLength;
  final String? architecture;
  final List<String> supportedLanguages;
  final bool supportsVision;
  final bool supportsCode;

  const TechnicalSpecs({
    this.parameterCount,
    this.contextLength,
    this.architecture,
    this.supportedLanguages = const [],
    this.supportsVision = false,
    this.supportsCode = false,
  });

  factory TechnicalSpecs.fromJson(Map<String, dynamic> json) => 
      _$TechnicalSpecsFromJson(json);
  Map<String, dynamic> toJson() => _$TechnicalSpecsToJson(this);
}

@JsonSerializable()
class PopularityMetrics {
  final double overallScore; // 0-100
  final CategoryScore developerCommunity;
  final CategoryScore academicInfluence;
  final CategoryScore practicalAdoption;
  final CategoryScore communityActivity;
  final TrendDirection trend;
  final List<TrendDataPoint> trendHistory;

  const PopularityMetrics({
    required this.overallScore,
    required this.developerCommunity,
    required this.academicInfluence,
    required this.practicalAdoption,
    required this.communityActivity,
    required this.trend,
    this.trendHistory = const [],
  });

  factory PopularityMetrics.fromJson(Map<String, dynamic> json) => 
      _$PopularityMetricsFromJson(json);
  Map<String, dynamic> toJson() => _$PopularityMetricsToJson(this);
}

@JsonSerializable()
class CategoryScore {
  final double score; // 0-100
  final Map<String, double?> breakdown; // 개별 지표 점수
  final bool isComplete; // 모든 데이터가 있는지

  const CategoryScore({
    required this.score,
    this.breakdown = const {},
    this.isComplete = true,
  });

  factory CategoryScore.fromJson(Map<String, dynamic> json) => 
      _$CategoryScoreFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryScoreToJson(this);
}

enum TrendDirection {
  @JsonValue('up')
  up,
  @JsonValue('down')
  down,
  @JsonValue('stable')
  stable,
}

@JsonSerializable()
class TrendDataPoint {
  final DateTime date;
  final double score;

  const TrendDataPoint({
    required this.date,
    required this.score,
  });

  factory TrendDataPoint.fromJson(Map<String, dynamic> json) => 
      _$TrendDataPointFromJson(json);
  Map<String, dynamic> toJson() => _$TrendDataPointToJson(this);
}

@JsonSerializable()
class ExternalLinks {
  final String? officialWebsite;
  final String? githubUrl;
  final String? paperUrl;
  final String? huggingFaceUrl;
  final String? documentationUrl;

  const ExternalLinks({
    this.officialWebsite,
    this.githubUrl,
    this.paperUrl,
    this.huggingFaceUrl,
    this.documentationUrl,
  });

  factory ExternalLinks.fromJson(Map<String, dynamic> json) => 
      _$ExternalLinksFromJson(json);
  Map<String, dynamic> toJson() => _$ExternalLinksToJson(this);
}
```

### 5.4 JSON 데이터 구조

```json
// data/llms.json
{
  "lastUpdated": "2026-01-11T00:00:00Z",
  "llms": [
    {
      "id": "gpt-4",
      "name": "GPT-4",
      "developer": "OpenAI",
      "releaseDate": "2023-03-14",
      "description": "OpenAI의 최신 대규모 멀티모달 언어 모델",
      "logoUrl": "https://example.com/gpt4-logo.png",
      "type": "commercial",
      "license": "Proprietary",
      "specs": {
        "parameterCount": 1700,
        "contextLength": 128000,
        "architecture": "Transformer",
        "supportedLanguages": ["en", "ko", "ja", "zh"],
        "supportsVision": true,
        "supportsCode": true
      },
      "popularity": {
        "overallScore": 88.2,
        "developerCommunity": {
          "score": 0,
          "breakdown": {},
          "isComplete": false
        },
        "academicInfluence": {
          "score": 92,
          "breakdown": {
            "citations": 95,
            "papers": 85,
            "citationGrowth": 90
          },
          "isComplete": true
        },
        "practicalAdoption": {
          "score": 95,
          "breakdown": {
            "apiUsage": 95
          },
          "isComplete": false
        },
        "communityActivity": {
          "score": 56.5,
          "breakdown": {
            "reddit": 95,
            "discord": null,
            "activityGrowth": 70
          },
          "isComplete": false
        },
        "trend": "up",
        "trendHistory": [
          {"date": "2025-07-01", "score": 82.1},
          {"date": "2025-08-01", "score": 83.5},
          {"date": "2025-09-01", "score": 85.2},
          {"date": "2025-10-01", "score": 86.0},
          {"date": "2025-11-01", "score": 87.1},
          {"date": "2025-12-01", "score": 88.2}
        ]
      },
      "tags": ["multimodal", "code", "reasoning", "vision"],
      "useCases": ["chatbot", "code_generation", "analysis"],
      "links": {
        "officialWebsite": "https://openai.com/gpt-4",
        "paperUrl": "https://arxiv.org/abs/2303.08774",
        "documentationUrl": "https://platform.openai.com/docs"
      },
      "updatedAt": "2026-01-11T00:00:00Z"
    }
  ]
}
```

### 5.5 성능 요구사항

| 지표 | 목표값 | 측정 방법 |
|------|--------|----------|
| First Contentful Paint (FCP) | < 1.5초 | Lighthouse |
| Largest Contentful Paint (LCP) | < 2.5초 | Lighthouse |
| Time to Interactive (TTI) | < 3초 | Lighthouse |
| Cumulative Layout Shift (CLS) | < 0.1 | Lighthouse |
| 초기 번들 크기 | < 500KB | Flutter build |
| API 응답 시간 | < 1초 | 네트워크 탭 |

### 5.6 폴더 구조

```
lib/
├── main.dart
├── app.dart
├── core/
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_sizes.dart
│   │   └── api_endpoints.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   └── dark_theme.dart
│   └── utils/
│       ├── popularity_calculator.dart
│       └── formatters.dart
├── data/
│   ├── models/
│   │   ├── llm_model.dart
│   │   └── popularity_metrics.dart
│   ├── repositories/
│   │   ├── llm_repository.dart
│   │   └── popularity_repository.dart
│   └── datasources/
│       ├── local_datasource.dart
│       └── remote_datasource.dart
├── presentation/
│   ├── providers/
│   │   ├── llm_list_provider.dart
│   │   ├── llm_detail_provider.dart
│   │   ├── search_provider.dart
│   │   ├── filter_provider.dart
│   │   └── compare_provider.dart
│   ├── screens/
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   └── widgets/
│   │   ├── detail/
│   │   │   ├── detail_screen.dart
│   │   │   └── widgets/
│   │   ├── compare/
│   │   │   ├── compare_screen.dart
│   │   │   └── widgets/
│   │   └── settings/
│   │       └── settings_screen.dart
│   └── widgets/
│       ├── llm_card.dart
│       ├── popularity_radar_chart.dart
│       ├── trend_line_chart.dart
│       ├── search_bar.dart
│       ├── filter_panel.dart
│       └── skeleton_loader.dart
└── router/
    └── app_router.dart
```

---

## 6. Design Requirements (디자인 요구사항)

### 6.1 디자인 원칙

| 원칙 | 설명 |
|------|------|
| **명확성** | 정보가 명확하고 이해하기 쉬워야 함 |
| **일관성** | 전체 사이트에서 일관된 디자인 언어 사용 |
| **효율성** | 최소한의 클릭으로 원하는 정보에 도달 |
| **접근성** | WCAG 2.1 AA 수준 준수 |

### 6.2 디자인 시스템

#### 색상 팔레트
```dart
// lib/core/constants/app_colors.dart

class AppColors {
  // Primary (신뢰감 있는 블루)
  static const primary = Color(0xFF2563EB);
  static const primaryLight = Color(0xFF3B82F6);
  static const primaryDark = Color(0xFF1D4ED8);
  
  // Secondary (강조용 그린)
  static const secondary = Color(0xFF10B981);
  static const secondaryLight = Color(0xFF34D399);
  
  // Accent (주의/경고)
  static const accent = Color(0xFFF59E0B);
  
  // Neutral
  static const background = Color(0xFFF8FAFC);
  static const surface = Color(0xFFFFFFFF);
  static const textPrimary = Color(0xFF1E293B);
  static const textSecondary = Color(0xFF64748B);
  static const border = Color(0xFFE2E8F0);
  
  // Dark Mode
  static const darkBackground = Color(0xFF0F172A);
  static const darkSurface = Color(0xFF1E293B);
  static const darkTextPrimary = Color(0xFFF1F5F9);
  static const darkTextSecondary = Color(0xFF94A3B8);
  
  // Semantic
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  
  // Chart Colors
  static const chartDeveloper = Color(0xFF3B82F6);
  static const chartAcademic = Color(0xFF8B5CF6);
  static const chartAdoption = Color(0xFF10B981);
  static const chartCommunity = Color(0xFFF59E0B);
}
```

#### 타이포그래피
```dart
// lib/core/constants/app_typography.dart

class AppTypography {
  static const fontFamily = 'Pretendard'; // 한글 지원 폰트
  
  static const headline1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 1.2,
  );
  
  static const headline2 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.3,
  );
  
  static const headline3 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  );
  
  static const body1 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const body2 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );
  
  static const caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.4,
  );
}
```

### 6.3 반응형 브레이크포인트

```dart
// lib/core/constants/app_sizes.dart

class AppBreakpoints {
  static const mobile = 600.0;
  static const tablet = 1024.0;
  static const desktop = 1440.0;
}

class AppSizes {
  // Padding
  static const paddingXS = 4.0;
  static const paddingSM = 8.0;
  static const paddingMD = 16.0;
  static const paddingLG = 24.0;
  static const paddingXL = 32.0;
  
  // Card
  static const cardBorderRadius = 12.0;
  static const cardElevation = 2.0;
  
  // Grid
  static int getGridColumns(double width) {
    if (width < AppBreakpoints.mobile) return 1;
    if (width < AppBreakpoints.tablet) return 2;
    if (width < AppBreakpoints.desktop) return 3;
    return 4;
  }
}
```

### 6.4 주요 화면 와이어프레임

#### 메인 페이지
```
┌─────────────────────────────────────────────────────────┐
│ ┌─────────────────────────────────────────────────────┐ │
│ │  Logo          [검색 바]           [다크모드] [설정]│ │
│ └─────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────┐ │
│ │  📊 총 150개 LLM | 🔥 인기 급상승: Llama 3 | ⬆️ 5  │ │
│ └─────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────┐ │
│ │ [필터] 라이선스 ▼  모델크기 ▼  용도 ▼  [정렬] ▼   │ │
│ └─────────────────────────────────────────────────────┘ │
├─────────────────────────────────────────────────────────┤
│                                                         │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐           │
│  │ GPT-4     │  │ Claude 3  │  │ Llama 3   │           │
│  │ OpenAI    │  │ Anthropic │  │ Meta      │           │
│  │ ⭐ 88.2   │  │ ⭐ 85.7   │  │ ⭐ 82.3   │           │
│  │ [비교추가]│  │ [비교추가]│  │ [비교추가]│           │
│  └───────────┘  └───────────┘  └───────────┘           │
│                                                         │
│  ┌───────────┐  ┌───────────┐  ┌───────────┐           │
│  │ Gemini    │  │ Mistral   │  │ Qwen      │           │
│  │ ...       │  │ ...       │  │ ...       │           │
│  └───────────┘  └───────────┘  └───────────┘           │
│                                                         │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────┐ │
│ │ 비교 목록: GPT-4, Claude 3 (2/5)    [비교하기] [X] │ │
│ └─────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

#### 상세 페이지
```
┌─────────────────────────────────────────────────────────┐
│ [← 뒤로]  GPT-4                              [공유]    │
├─────────────────────────────────────────────────────────┤
│ ┌───────────────────────────────────────────────────┐   │
│ │  [Logo]  GPT-4                                    │   │
│ │          OpenAI | 2023.03.14 | Commercial         │   │
│ │          종합 인기도: ⭐ 88.2 (↑ +2.1)           │   │
│ │          [웹사이트] [논문] [문서]                 │   │
│ └───────────────────────────────────────────────────┘   │
├─────────────────────────────────────────────────────────┤
│ [개요] [인기도] [사양] [관련 모델]                      │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────┐ ┌─────────────────────┐         │
│ │    레이더 차트      │ │    트렌드 차트      │         │
│ │     (4카테고리)     │ │    (6개월 추이)     │         │
│ └─────────────────────┘ └─────────────────────┘         │
├─────────────────────────────────────────────────────────┤
│ ┌─────────────────────────────────────────────────────┐ │
│ │ 카테고리별 상세                                     │ │
│ │ ┌─────────────┐ ┌─────────────┐                    │ │
│ │ │ 개발자 N/A  │ │ 학술 92점   │                    │ │
│ │ └─────────────┘ └─────────────┘                    │ │
│ │ ┌─────────────┐ ┌─────────────┐                    │ │
│ │ │ 채택도 95점 │ │ 커뮤니티 57점│                    │ │
│ │ └─────────────┘ └─────────────┘                    │ │
│ └─────────────────────────────────────────────────────┘ │
└─────────────────────────────────────────────────────────┘
```

---

## 7. Timeline & Milestones (타임라인)

### 7.1 전체 일정: 12주

```
Week 1-2   ████████░░░░░░░░░░░░░░░░ Phase 1: 기반 구축
Week 3-4   ░░░░░░░░████████░░░░░░░░ Phase 1: LLM 목록
Week 5-6   ░░░░░░░░░░░░░░░░████████ Phase 2: 인기도 시스템
Week 7-8   ████████░░░░░░░░░░░░░░░░ Phase 2: 검색/필터
Week 9-10  ░░░░░░░░████████░░░░░░░░ Phase 3: 비교 기능
Week 11-12 ░░░░░░░░░░░░░░░░████████ Phase 4: 최적화/배포
```

### 7.2 Phase별 상세

#### Phase 1: 기반 구축 (Week 1-4)
**목표**: 핵심 구조 완성 및 LLM 목록 표시

| Week | 작업 | 산출물 |
|------|------|--------|
| 1 | 프로젝트 설정, 폴더 구조, 테마 | 기본 앱 구조 |
| 2 | 데이터 모델, Repository 패턴, 라우팅 | 데이터 레이어 |
| 3 | LLM 카드 컴포넌트, 그리드 레이아웃 | 메인 화면 |
| 4 | 상세 페이지, 스켈레톤 UI, 에러 처리 | 상세 화면 |

**마일스톤 M1**: LLM 목록 및 상세 페이지 완성

#### Phase 2: 인기도 시스템 (Week 5-8)
**목표**: 인기도 계산 및 시각화

| Week | 작업 | 산출물 |
|------|------|------|
| 5 | Python 데이터 수집 스크립트 | 데이터 파이프라인 |
| 6 | 인기도 계산 로직, 정규화 | 인기도 점수 |
| 7 | 레이더 차트, 라인 차트 | 시각화 컴포넌트 |
| 8 | 검색, 필터, 정렬 기능 | 탐색 기능 |

**마일스톤 M2**: MVP 완성 (Alpha 릴리스)

#### Phase 3: 고급 기능 (Week 9-10)
**목표**: 비교 기능 및 부가 기능

| Week | 작업 | 산출물 |
|------|------|------|
| 9 | 비교 목록 관리, 비교 테이블 | 비교 화면 |
| 10 | 가중치 커스터마이징, 다크모드 | 설정 기능 |

**마일스톤 M3**: 비교 기능 완성 (Beta 릴리스)

#### Phase 4: 최적화 및 배포 (Week 11-12)
**목표**: 성능 최적화 및 프로덕션 배포

| Week | 작업 | 산출물 |
|------|------|------|
| 11 | 성능 최적화, 접근성 개선, 테스트 | 최적화된 앱 |
| 12 | GitHub Actions 배포, 문서화 | 프로덕션 배포 |

**마일스톤 M4**: v1.0 정식 릴리스

### 7.3 릴리스 계획

| 버전 | 시점 | 범위 | 대상 |
|------|------|------|------|
| Alpha | Week 8 | MVP (목록, 상세, 인기도) | 내부 테스트 |
| Beta | Week 10 | + 비교, 검색, 필터 | 제한된 사용자 |
| v1.0 | Week 12 | 전체 기능 | 공개 |

---

## 8. Risks & Mitigation (리스크 관리)

### 8.1 기술적 리스크

| 리스크 | 확률 | 영향 | 완화 방안 |
|--------|------|------|----------|
| **API Rate Limit** | 중간 | 높음 | - 캐싱 적극 활용 (24시간)<br>- GitHub Actions 일일 1회 실행<br>- 여러 API 키 로테이션 |
| **Flutter Web 성능** | 낮음 | 중간 | - 코드 스플리팅<br>- 이미지 최적화<br>- 필요시 CanvasKit → HTML 렌더러 |
| **데이터 불완전성** | 높음 | 중간 | - 불완전 데이터 명시적 표시<br>- 가중치 재분배 로직<br>- 수동 데이터 보완 |

### 8.2 비즈니스 리스크

| 리스크 | 확률 | 영향 | 완화 방안 |
|--------|------|------|----------|
| **사용자 확보 실패** | 중간 | 높음 | - SEO 최적화<br>- 개발자 커뮤니티 홍보<br>- 오픈소스 공개 |
| **데이터 정확성 이슈** | 낮음 | 높음 | - 데이터 출처 명시<br>- 사용자 피드백 시스템<br>- 정기 검증 |

---

## 9. Success Metrics (성공 지표)

### 9.1 정량적 지표 (KPI)

| 지표 | 목표 (3개월) | 목표 (6개월) | 측정 방법 |
|------|-------------|-------------|----------|
| MAU | 3,000 | 10,000 | Google Analytics |
| DAU | 300 | 1,000 | Google Analytics |
| 평균 세션 시간 | 3분 | 5분 | Google Analytics |
| 검색 사용률 | 50% | 60% | 이벤트 트래킹 |
| 비교 기능 사용률 | 20% | 30% | 이벤트 트래킹 |
| 페이지 로딩 시간 | < 2초 | < 1.5초 | Lighthouse |

### 9.2 정성적 지표

| 지표 | 목표 | 측정 방법 |
|------|------|----------|
| 사용자 만족도 | 4.5/5.0 | 설문조사 |
| NPS | 50+ | 설문조사 |
| GitHub Stars | 500+ | GitHub |

---

## 10. Future Considerations (향후 계획)

### 10.1 Phase 2 기능 (v1.1)
- 사용자 계정 시스템
- 즐겨찾기 클라우드 동기화
- LLM 알림 (새 모델 추가, 인기도 변화)

### 10.2 Phase 3 기능 (v2.0)
- 벤치마크 성능 비교
- 비용 계산기
- 커뮤니티 리뷰 시스템

### 10.3 장기 로드맵
- 모바일 앱 (Flutter 활용)
- 공개 API 제공
- 다국어 지원 (영어, 일본어, 중국어)

---

## 부록 A: 참고 자료

### A.1 기술 문서
- [Flutter Web 공식 문서](https://docs.flutter.dev/platform-integration/web)
- [fl_chart 문서](https://pub.dev/packages/fl_chart)
- [Riverpod 문서](https://riverpod.dev/)

### A.2 디자인 리소스
- [Material Design 3](https://m3.material.io/)
- [WCAG 2.1 가이드라인](https://www.w3.org/WAI/WCAG21/quickref/)

### A.3 데이터 소스
- [GitHub API](https://docs.github.com/en/rest)
- [Hugging Face Hub API](https://huggingface.co/docs/huggingface_hub)
- [Semantic Scholar API](https://api.semanticscholar.org/)

---

## 부록 B: 용어 정의

| 용어 | 정의 |
|------|------|
| LLM | Large Language Model (대규모 언어 모델) |
| MVP | Minimum Viable Product (최소 기능 제품) |
| FCP | First Contentful Paint (첫 콘텐츠 렌더링 시간) |
| LCP | Largest Contentful Paint (최대 콘텐츠 렌더링 시간) |
| CLS | Cumulative Layout Shift (누적 레이아웃 이동) |

---

**문서 끝**

---

## 변경 이력

| 버전 | 날짜 | 작성자 | 변경 내용 |
|------|------|--------|----------|
| 1.0.0 | 2026-01-11 | AI Assistant | 6가지 PRD 장점 통합하여 초안 작성 |
