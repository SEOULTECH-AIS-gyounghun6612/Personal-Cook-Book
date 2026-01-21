# 브랜치(Branch) 관리

브랜치 관리는 크게 '관리(생성/조회/삭제)'와 '이동(작업 전환)'으로 구성
Git 2.23 버전부터는 기능이 혼재되어 있던 `checkout` 대신, 목적이 명확한 `switch`(이동)와 `restore`(복구) 사용을 권장

## 목차

1. [관리 : git branch](#1-관리--git-branch)
2. [이동 : git switch](#2-이동--git-switch)
3. [복구 : git restore](#3-복구--git-restore)
4. [구버전 명령어 : git checkout](#4-구버전-명령어--git-checkout)
5. [병합 : git merge](#5-병합--git-merge)

## 1. 관리 : `git branch`

브랜치를 새로 만들거나, 목록을 확인하고, 다 쓴 브랜치를 삭제하는 등 전반적인 관리를 수행

### 1) 목록 조회 (List)

현재 존재하는 브랜치들을 확인 -> `*` 표시가 된 것이 현재 작업 중인 브랜치

```bash
# 로컬 브랜치 목록
git branch

# 원격 브랜치 포함 모든 목록
git branch -a
```

### 2) 생성 (Create)

새로운 작업 공간(브랜치)을 생성 (단, 이동하지 않음)

```bash
# 'feature/login' 브랜치 생성
git branch feature/login
```

### 3) 삭제 (Delete)

작업이 끝나 병합된 브랜치를 삭제

```bash
# 안전 삭제 (병합 여부 확인)
git branch -d feature/login

# 강제 삭제 (병합 여부 무시, 주의!)
git branch -D feature/login
```

---

## 2. 이동 : `git switch`

브랜치(작업 공간)를 실제로 변경하는 전용 명령어 (Git 2.23+)

### 1) 기존 방식 : `git checkout`

브랜치 이동과 파일 복구 기능을 모두 수행하는 만능 명령어 (여전히 많이 사용됨)

```bash
# 'feature/login' 브랜치로 이동
git switch feature/login
```

  ```bash
  # 'feature/login' 브랜치로 이동
  git checkout feature/login
  ```

`-c` (create) 옵션을 사용하여 브랜치를 만들고 즉시 그곳으로 이동

```bash
# 'feature/signup' 생성 및 이동
git switch -c feature/signup
```

### 3) 고아 브랜치 생성 (Orphan)

`--orphan` 옵션으로 기존 이력과 끊어진 새로운 브랜치 생성 (Git 2.27+)

```bash
# 이력이 없는 'gh-pages' 생성 및 이동
git switch --orphan gh-pages
```

---

## 3. 복구 : `git restore`

작업 중인 파일의 변경 사항을 되돌리거나 스테이지에서 내리는 전용 명령어 (Git 2.23+)

### 1) 파일 변경 취소 (Discard Changes)

수정했던 파일을 마지막 커밋 상태로 되돌림 (주의: 복구 불가능)

```bash
# 특정 파일 되돌리기
git restore README.md

# 현재 경로의 모든 파일 되돌리기
git restore .
```

### 2) 스테이징 취소 (Unstage)

`git add`로 스테이지에 올린 파일을 다시 내림 (파일 내용은 유지됨)

```bash
# 스테이지에서 내리기
git restore --staged README.md
```

---

## 4. 구버전 명령어 : `git checkout`

`switch`와 `restore`가 나오기 전까지 사용되던 만능 명령어로, 여전히 많이 사용됨.

* 브랜치 이동: `git checkout [BRANCH]` (= `git switch`)
* 브랜치 생성 및 이동: `git checkout -b [BRANCH]` (= `git switch -c`)
* 파일 복구: `git checkout -- [FILE]` (= `git restore`)

---

## 5. 병합 : `git merge`

분리된 작업 공간에서 완료된 내용을 다시 하나로 병합

### 1) 일반 병합 (Merge) -> 브랜치의 이력을 그대로 유지

'받는 쪽(Target)' 브랜치로 이동한 뒤, '가져올(Source)' 브랜치를 병합

```bash
# 1. 메인 브랜치로 이동 (받는 쪽)
git switch master

# 2. 기능 브랜치 병합 (가져올 쪽)
git merge feature/login
```

### 2) 스쿼시 병합 (Squash Merge)

가져올 브랜치의 모든 커밋 이력을 압축, 현재 브랜치에 새로운 커밋 하나로 추가

```bash
# 1. 메인 브랜치로 이동
git switch master

# 2. 기능 브랜치를 압축하여 병합
git merge --squash feature/login

# 3. 하나의 커밋으로 저장
git commit -m "Add login feature (Squashed)"
```
