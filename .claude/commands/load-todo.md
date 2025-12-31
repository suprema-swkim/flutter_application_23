# TODO 파일 로드

TODO 마크다운 파일을 읽어서 TodoWrite 도구로 할 일 목록을 세팅합니다.

## 인자

- `$ARGUMENTS`: TODO 파일 경로 (예: TODO.md, docs/tasks.md)

---

## 수행 작업

1. `$ARGUMENTS` 경로의 파일을 읽습니다
2. 마크다운 체크박스 형식(`- [ ]`, `- [x]`)을 파싱합니다
3. TodoWrite 도구를 사용하여 할 일 목록을 세팅합니다

### 파싱 규칙

- `- [ ]` 로 시작하는 항목 → `pending` 상태
- `- [x]` 로 시작하는 항목 → `completed` 상태
- `activeForm`은 content에서 동사를 현재진행형으로 변환 (예: "구현" → "구현 중", "추가" → "추가 중")

### 예시

```markdown
- [ ] LoginPage 위젯 파일 생성
- [x] 프로젝트 초기 설정
```

위 내용은 다음과 같이 변환됩니다:

```json
[
  {"content": "LoginPage 위젯 파일 생성", "status": "pending", "activeForm": "LoginPage 위젯 파일 생성 중"},
  {"content": "프로젝트 초기 설정", "status": "completed", "activeForm": "프로젝트 초기 설정 중"}
]
```

---

**지금 `$ARGUMENTS` 파일을 읽고 TodoWrite로 할 일 목록을 세팅해주세요.**
