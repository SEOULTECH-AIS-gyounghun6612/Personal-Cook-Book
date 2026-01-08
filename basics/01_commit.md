# 커밋(Commit) 관리

커밋은 프로젝트의 특정 시점을 사진 찍듯 저장하는 행위입니다. 작업한 내용을 선택(Staging)하고, 설명을 달아 저장소에 영구적으로 기록

## 목차

1. [스테이징 (Staging)](#1-스테이징-staging)
2. [기록 (Commit)](#2-기록-commit)
3. [커밋 정리 (Interactive Rebase)](#3-커밋-정리-interactive-rebase)
4. [조회 (Log)](#4-조회-log)
5. [취소 (Undo)](#5-취소-undo)

## 1. 스테이징 (Staging)

수정한 파일 중 커밋에 포함시킬 파일을 선택하여 대기 공간(= 스테이지)에 추가

### 파일 추가 : `git add [FILE_NAME]`

작업 디렉터리(Working Directory)의 변경 사항을 스테이지(Staging Area)로 이동

```bash
# 특정 파일만 스테이지에 추가
git add README.md

# 현재 디렉터리의 모든 변경 사항(신규/수정/삭제) 추가
git add .
```

## 2. 기록 (Commit)

스테이지에 올라온 파일들을 하나의 버전으로 묶어 저장

### 커밋 생성 : `git commit -m "[MESSAGE]"`

의미 있는 메시지와 함께 변경 사항을 저장소(Repository)에 확정 기록

```bash
# 메시지와 함께 커밋 생성
git commit -m "Add login feature"
```

### 커밋 수정 및 덮어쓰기 : `git commit --amend`

방금 생성한 커밋을 수정 오타를 수정하거나, 빠뜨린 파일을 방금 전 커밋에 합쳐서 하나로 만들 때 유용

```bash
# 1. 메시지만 수정하고 싶을 때
git commit --amend -m "Fix typo in commit message"

# 2. 파일 추가를 깜빡했을 때 (기존 커밋에 병합)
git add omitted_file.txt
git commit --amend --no-edit  # --no-edit: 기존 메시지 유지
```

## 3. 커밋 정리 (Interactive Rebase)

같은 브랜치 내에서 여러 개의 지저분한 커밋을 하나로 합치거나, 메시지를 수정하고, 순서를 바꾸는 등 커밋 이력을 깔끔하게 정리

### 대화형 리베이스 실행: `git rebase -i HEAD~[N]`

최근 N개의 커밋을 대상으로 대화형 모드를 시작

- `HEAD~[N]`: 현재 작업 중인 브랜치의 최신 커밋(`HEAD`)으로부터 위로 N번째까지의 범위를 지정 (예: `HEAD~3`은 최신 3개 커밋)

```bash
# 최근 3개의 커밋을 정리
git rebase -i HEAD~3
```

### 주요 명령 옵션

편집기 창이 열리면 각 커밋 앞에 적힌 `pick` 키워드를 아래 옵션으로 변경하여 작업을 지시

| 명령어 | 약어 | 설명 |
| :--- | :--- | :--- |
| pick | `p` | 커밋을 그대로 유지 (기본값) |
| reword | `r` | 커밋 메시지만 수정 |
| edit | `e` | 커밋 내용을 수정 (작업 도중 멈춤) |
| squash | `s` | 해당 커밋을 이전(위) 커밋과 합치고, 메시지도 통합 |
| fixup | `f` | `squash`와 같으나, 해당 커밋의 메시지는 버리고 이전 커밋 메시지만 유지 |
| drop | `d` | 해당 커밋을 삭제 |

```bash
# 1. 편집기 초기 화면 (수정 전: 모두 pick 상태)
pick a1b2c3d 기능 구현 완료
pick b2c3d4e 오타 수정
pick c3d4e5f 주석 추가

# 2. 편집 내용 수정 (수정 후: squash 및 fixup 적용)
pick a1b2c3d 기능 구현 완료
squash b2c3d4e 오타 수정
fixup c3d4e5f 주석 추가

# 3. 결과 요약
# - 위 3개의 커밋이 맨 위 'a1b2c3d' 커밋 하나로 합쳐집니다.
# - '오타 수정' 메시지는 본문에 합쳐지고(squash), '주석 추가' 메시지는 삭제(fixup)
```

### 루트 커밋부터 수정: `git rebase -i --root`

프로젝트의 시작점(첫 번째 커밋)부터 현재까지의 모든 커밋을 대상으로 리베이스를 수행

```bash
# 첫 커밋부터 모든 내역을 수정
git rebase -i --root
```

## 4. 조회 (Log)

저장된 커밋들의 역사를 확인

### 이력 확인 : `git log [OPTIONS]`

누가, 언제, 무엇을 변경했는지 시간순으로 출력

```bash
# 전체 이력 상세 확인
git log

# 각 커밋을 한 줄로 요약하여 보기 (해시값 + 메시지)
git log --oneline

# 브랜치 분기 및 병합 흐름을 그래프로 시각화
git log --graph --all --oneline
```

## 5. 취소 (Undo)

이전 작업 내용을 취소 (주의: `--hard` 옵션은 복구가 불가능할 수 있음)

### 과거로 되돌리기 : `git reset [MODE] [COMMIT]`

특정 시점 (= 커밋, commit)으로 복원 -> 돌아간 시점 이후의 이력(= 커밋, commit)은 삭제

```bash
# 최근 커밋 1개를 취소하고, 변경 내용은 작업 공간에 보존 (기본값)
git reset HEAD^  # 또는 --mixed

# 최근 커밋 1개를 취소하고, 변경 내용까지 모두 삭제 (위험!)
git reset --hard HEAD^
```

### 변경 사항 상쇄 : `git revert [COMMIT]`

기존 커밋 내역을 삭제하지 않고, 해당 커밋의 변경 사항을 정반대로 수행하는 새로운 커밋을 생성 (협업 시 안전)

```bash
# 특정 커밋의 작업을 취소하는 새 커밋 생성
git revert <COMMIT_HASH>
```
