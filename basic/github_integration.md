# GitHub 연동 설정

## 개요

- VS Code는 Git 및 GitHub 기능을 기본 내장.
- 별도 설치 없이 계정 연동만으로 코드 동기화 가능.

## 연동 절차

1. Git 설치 확인
   - 시스템에 Git이 설치되어 있어야 함.
   - 터미널에서 `git --version` 입력하여 확인.

2. GitHub 계정 로그인
   - 좌측 하단 '계정(Accounts)' 아이콘 클릭.
   - 'Turn on Settings Sync...' 또는 'Sign in to Sync Settings' 선택.
   - 'Sign in with GitHub' 선택 및 브라우저 인증 진행.

3. 리포지토리 작업
   - Clone: 탐색기(Explorer) > 'Clone Repository' > GitHub 리포지토리 URL 입력.
   - Commit & Push: 소스 제어(Source Control) 패널(`Ctrl+Shift+G`) 이용.
   - 변경 사항 스테이징(+) 후 커밋 메시지 입력 및 커밋.
   - 'Sync Changes' 버튼으로 원격 저장소와 동기화.
