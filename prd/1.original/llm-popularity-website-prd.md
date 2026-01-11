# LLM 종류 및 인기도 웹사이트 PRD

## 1. 프로젝트 개요

### 1.1 프로젝트명
LLM Popularity Tracker (LLM 인기도 추적 웹사이트)

### 1.2 프로젝트 목적
AI 분야에서 사용되는 다양한 LLM(Large Language Model)의 종류, 특징, 인기도를 시각적으로 보여주는 웹사이트를 개발합니다. 사용자들이 현재 AI 시장에서 활발히 사용되는 LLM들을 한눈에 파악하고 비교할 수 있도록 합니다.

### 1.3 타겟 사용자
- AI 개발자 및 연구자
- AI 기술에 관심이 있는 일반 사용자
- 기업의 AI 도입 의사결정자
- 학생 및 교육자

## 2. 핵심 기능 요구사항

### 2.1 LLM 목록 및 상세 정보
- **기능**: 다양한 LLM 모델의 목록을 카드 형태로 표시
- **표시 정보**:
  - 모델명 (예: GPT-4, Claude, Gemini, Llama 등)
  - 개발사/조직
  - 출시일
  - 모델 파라미터 수
  - 주요 특징 및 용도
  - 오픈소스 여부
  - API 제공 여부
- **필터링**: 
  - 오픈소스/상용 필터
  - 개발사별 필터
  - 출시 연도별 필터
  - 파라미터 규모별 필터

### 2.2 인기도 지표 시각화
- **기능**: 각 LLM의 인기도를 다양한 지표로 시각화
- **지표 종류**:
  - GitHub Stars 수
  - 다운로드/사용량 통계
  - 논문 인용 수
  - 커뮤니티 활동도 (Reddit, Twitter/X 언급 수)
  - Google Trends 데이터
  - Stack Overflow 질문 수
- **시각화 방식**:
  - 막대 그래프
  - 파이 차트
  - 라인 차트 (시간에 따른 추이)
  - 히트맵
  - 인터랙티브 차트 (Chart.js, D3.js 등 활용)

### 2.3 비교 기능
- **기능**: 여러 LLM을 선택하여 비교
- **비교 항목**:
  - 성능 벤치마크 점수
  - 가격 정보
  - 지원 언어
  - 컨텍스트 윈도우 크기
  - 응답 속도
  - 지원 기능 (이미지, 음성, 코드 등)

### 2.4 검색 및 정렬
- **기능**: LLM 검색 및 다양한 기준으로 정렬
- **검색**: 모델명, 개발사명으로 검색
- **정렬 기준**:
  - 인기도 순
  - 출시일 순
  - 파라미터 수 순
  - 이름 순

### 2.5 상세 페이지
- **기능**: 각 LLM의 상세 정보 페이지
- **포함 내용**:
  - 상세 설명
  - 성능 벤치마크 결과
  - 사용 사례
  - 공식 문서 링크
  - 관련 뉴스 및 업데이트
  - 커뮤니티 링크

## 3. 기술 스택 제안

### 3.1 프론트엔드
- **프레임워크**: React 또는 Next.js
- **스타일링**: Tailwind CSS 또는 Material-UI
- **차트 라이브러리**: Chart.js, Recharts, 또는 D3.js
- **상태 관리**: Redux 또는 Zustand
- **데이터 페칭**: React Query 또는 SWR

### 3.2 백엔드 (선택사항)
- **API 서버**: Node.js/Express 또는 Python/FastAPI
- **데이터베이스**: PostgreSQL 또는 MongoDB
- **데이터 수집**: 
  - GitHub API
  - Google Trends API
  - Reddit API
  - Twitter/X API (가능한 경우)

### 3.3 데이터 소스
- **주요 LLM 정보**: 수동 수집 또는 공개 데이터셋
- **인기도 지표**: 
  - GitHub API (Stars, Forks)
  - npm/pip 다운로드 통계
  - Google Trends API
  - Hugging Face 모델 다운로드 수
  - 논문 인용 데이터 (Google Scholar, Semantic Scholar)

### 3.4 배포
- **호스팅**: Vercel, Netlify, 또는 AWS
- **CI/CD**: GitHub Actions

## 4. UI/UX 요구사항

### 4.1 디자인 원칙
- **모던하고 깔끔한 디자인**: 미니멀리즘 스타일
- **반응형 디자인**: 모바일, 태블릿, 데스크톱 지원
- **다크 모드 지원**: 사용자 선호도에 따른 테마 전환
- **접근성**: WCAG 2.1 AA 수준 준수

### 4.2 주요 페이지 구조
1. **홈페이지 (메인 대시보드)**
   - 인기 LLM Top 10
   - 최신 추가된 LLM
   - 카테고리별 빠른 탐색
   - 검색 바

2. **LLM 목록 페이지**
   - 그리드/리스트 뷰 전환
   - 필터 사이드바
   - 정렬 옵션
   - 페이지네이션

3. **LLM 상세 페이지**
   - 상단: 모델 기본 정보 카드
   - 중간: 인기도 차트 섹션
   - 하단: 성능 비교, 사용 사례

4. **비교 페이지**
   - 선택된 LLM들의 나란한 비교 테이블
   - 차트로 시각적 비교

### 4.3 인터랙션
- **호버 효과**: 카드에 마우스 오버 시 상세 정보 미리보기
- **애니메이션**: 부드러운 페이지 전환 및 차트 애니메이션
- **로딩 상태**: 데이터 로딩 중 스켈레톤 UI 표시

## 5. 데이터 모델

### 5.1 LLM 엔티티
```typescript
interface LLM {
  id: string;
  name: string;
  developer: string;
  releaseDate: string;
  parameters: number; // in billions
  isOpenSource: boolean;
  hasAPI: boolean;
  description: string;
  useCases: string[];
  supportedLanguages: string[];
  contextWindow: number;
  officialWebsite: string;
  documentation: string;
  githubRepo?: string;
  license: string;
}
```

### 5.2 인기도 지표 엔티티
```typescript
interface PopularityMetrics {
  llmId: string;
  date: string;
  githubStars: number;
  githubForks: number;
  downloads: number;
  citations: number;
  redditMentions: number;
  twitterMentions: number;
  googleTrendsScore: number;
  stackOverflowQuestions: number;
}
```

### 5.3 성능 벤치마크 엔티티
```typescript
interface Benchmark {
  llmId: string;
  benchmarkName: string; // MMLU, HellaSwag, HumanEval 등
  score: number;
  date: string;
}
```

## 6. 개발 단계 (MVP 우선순위)

### Phase 1: MVP (최소 기능 제품)
- [ ] 기본 LLM 목록 표시 (20-30개 주요 LLM)
- [ ] 카드 형태의 LLM 정보 표시
- [ ] 기본 검색 기능
- [ ] 간단한 필터링 (오픈소스/상용)
- [ ] GitHub Stars 수 표시
- [ ] 반응형 디자인

### Phase 2: 인기도 시각화
- [ ] 다양한 인기도 지표 수집
- [ ] 차트 라이브러리 통합
- [ ] 인기도 차트 표시
- [ ] 시간에 따른 추이 그래프

### Phase 3: 고급 기능
- [ ] LLM 비교 기능
- [ ] 상세 페이지 구현
- [ ] 성능 벤치마크 데이터 통합
- [ ] 다크 모드

### Phase 4: 데이터 자동화
- [ ] API 연동으로 자동 데이터 수집
- [ ] 정기적인 데이터 업데이트
- [ ] 알림 기능 (새로운 LLM 추가 시)

## 7. 성공 지표 (KPI)

### 7.1 사용자 지표
- 월간 활성 사용자 수 (MAU)
- 페이지 뷰 수
- 평균 세션 시간
- 이탈률

### 7.2 기능 사용 지표
- 검색 사용 빈도
- 비교 기능 사용률
- 상세 페이지 조회 수

### 7.3 데이터 품질 지표
- 포함된 LLM 수
- 데이터 업데이트 주기
- 데이터 정확도

## 8. 제약사항 및 고려사항

### 8.1 기술적 제약
- API 사용량 제한 (GitHub API, Google Trends 등)
- 데이터 수집의 정확성 및 신뢰성
- 실시간 데이터 업데이트의 어려움

### 8.2 법적/윤리적 고려사항
- 각 LLM의 라이선스 정보 정확히 표시
- 상업적 모델과 오픈소스 모델의 공정한 비교
- 저작권 및 상표권 존중

### 8.3 데이터 품질
- 인기도 지표의 객관성 확보
- 벤치마크 데이터의 출처 명시
- 데이터 업데이트 주기 관리

## 9. 향후 확장 계획

### 9.1 추가 기능
- 사용자 리뷰 및 평점 시스템
- LLM 추천 기능 (용도별)
- 커뮤니티 포럼
- 뉴스레터 구독

### 9.2 데이터 확장
- 더 많은 LLM 추가
- 더 상세한 벤치마크 결과
- 비용 계산기
- ROI 계산 도구

### 9.3 기술 개선
- PWA (Progressive Web App) 지원
- 오프라인 모드
- 다국어 지원
- 접근성 개선

## 10. 타임라인 (예상)

- **Week 1-2**: 기획 및 디자인
- **Week 3-4**: 기본 구조 및 LLM 목록 구현
- **Week 5-6**: 인기도 지표 수집 및 시각화
- **Week 7-8**: 비교 기능 및 상세 페이지
- **Week 9-10**: 테스트 및 버그 수정
- **Week 11-12**: 배포 및 최적화

## 11. 참고 자료

### 11.1 데이터 소스
- Hugging Face Model Hub
- Papers with Code
- GitHub Trending
- AI Research Papers

### 11.2 벤치마크
- MMLU (Massive Multitask Language Understanding)
- HellaSwag
- HumanEval
- GLUE
- SuperGLUE

---

**문서 버전**: 1.0  
**작성일**: 2024  
**최종 수정일**: 2024
