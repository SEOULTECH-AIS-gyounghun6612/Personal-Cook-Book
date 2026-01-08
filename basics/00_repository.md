# 저장소 (Repository) 관리

Git 프로젝트의 시작인 저장소 생성과, 파일 추적 상태 관리 및 무시 설정 가이드

## 목차

1. [저장소 생성 (Initialize)](#1-저장소-생성-initialize)
2. [파일 상태 (Lifecycle)](#2-파일-상태-lifecycle)
3. [무시 설정 (.gitignore)](#3-무시-설정-gitignore)
4. [추적 중단 (Stop Tracking)](#4-추적-중단-stop-tracking)

## 1. 저장소 생성 (Initialize)

Git이 프로젝트를 관리하도록 설정

### 저장소 생성 : `git init`

프로젝트당 한 번만 수행하여 현재 디렉터리에 `.git`이라는 숨김 폴더를 생성하여 버전 관리를 시작

```bash
# 현재 디렉터리를 Git 저장소로 초기화
git init
```

## 2. 파일 상태 (Lifecycle)

파일은 Git의 관리 여부에 따라 두 가지 상태가 존재

### Tracked (관리 대상)

이미 스냅샷(커밋)에 포함되어 있거나, `staging area`에 등록된 파일

* Unmodified: 수정되지 않음
* Modified: 수정되었으나 스테이징되지 않음
* Staged: 커밋을 위해 스테이징됨

### Untracked (관리 대상 아님)

작업 디렉터리에 있지만 Git이 추적하지 않는 파일 (새로 생성된 파일, 추적 제외 등)

## 3. 무시 설정 (.gitignore)

로그, 빌드 결과물, 비밀 키 등 Git 관리가 필요 없는 파일을 정의

### 규칙 작성 : `.gitignore`

프로젝트 루트에 `.gitignore` 파일을 생성하고 패턴을 정의

* `#`: 주석
* `*`: 모든 문자열 (와일드카드)
* `/`: 디렉터리 경로
* `!`: 예외 처리 (무시하지 않음)

```gitignore
# 1. 확장자가 .log인 모든 파일 무시
*.log

# 2. build 폴더 내부의 모든 파일 무시
build/

# 3. .env 파일(보안 정보) 무시
.env

# 4. 모든 .txt를 무시하되, notice.txt는 추적
*.txt
!notice.txt
```

## 4. 추적 중단 (Stop Tracking)

실수로 업로드된 파일을 Git 관리에서만 제외하고, 로컬 파일은 유지

### 캐시 삭제 : `git rm --cached [FILE_NAME]`

파일을 로컬 디스크에는 남겨두고, Git의 추적 목록(Staging Area)에서만 제거 이후 `.gitignore`에 추가하면 다시는 추적되지 않음

```bash
# Git 추적만 중단 (파일 삭제 X)
git rm --cached secret.key

# 변경 사항 커밋
git commit -m "Stop tracking secret.key"
```
