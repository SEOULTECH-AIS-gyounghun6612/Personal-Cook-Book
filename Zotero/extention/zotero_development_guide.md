# Better BibTeX (BBT) 가이드

Zotero와 LaTeX/Markdown 환경을 연결하는 핵심 확장 프로그램.

## 1. 주요 기능
- **고유 인용 키(Cite Key) 생성**: 저자명, 연도, 제목 등을 조합한 충돌 없는 인용 키 자동 생성.
- **BibTeX/BibLaTeX 동기화**: Zotero 라이브러리 변경 시 연결된 `.bib` 파일을 실시간으로 업데이트.
- **인용 키 고정(Pinning)**: 한 번 생성된 인용 키가 변하지 않도록 고정하여 문서 정합성 유지.
- **수학 기호 처리**: 서지 정보 내 특수 기호를 LaTeX 명령어로 변환하여 출력 오류 방지.

## 2. 설치 방법
1. [BBT GitHub Releases](https://github.com/retorquere/zotero-better-bibtex/releases)에서 최신 `.xpi` 파일 다운로드.
2. Zotero 실행 후 `도구(Tools)` -> `부가 기능(Add-ons)` 메뉴 이동.
3. 우측 상단 톱니바퀴 아이콘 클릭 -> `Install Add-on From File...` 선택.
4. 다운로드한 `.xpi` 파일 선택 후 설치 및 Zotero 재시작.

## 3. 활용 팁
- **인용 키 형식 설정**: `편집` -> `설정` -> `Better BibTeX` -> `Citation keys` 탭에서 패턴 설정 가능.
    - **권장 예시**: `[auth:lower][year][veryshorttitle:lower]` (저자소문자 + 연도 + 핵심제목소문자)
- **자동 내보내기(Keep updated)**: 내보내기 설정 시 'Keep updated' 옵션을 체크하면 별도 조작 없이 최신 서지 정보 유지.