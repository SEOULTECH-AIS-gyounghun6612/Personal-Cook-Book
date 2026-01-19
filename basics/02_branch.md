# 브랜치(Branch) 관리

브랜치 관리는 크게 '관리(생성/조회/삭제)'를 담당하는 `git branch`와 '이동(작업 전환)'을 담당하는 `git checkout` 두 가지 명령어로 진행

## 목차

1. [관리 : git branch](#1-관리--git-branch)

2. [변경 : Switch & Restore](#2-변경--switch--restore)

3. [병합 : git merge](#3-병합--git-merge)

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

## 2. 변경 : Switch & Restore

작업 공간(브랜치)을 변경하거나 파일 상태를 변경(복구)하는 명령어.
과거에는 `git checkout` 하나로 수행했으나, Git 2.23부터는 목적에 맞는 전용 명령어 사용을 권장.

### 1) 기존 방식 : `git checkout`

브랜치 이동과 파일 복구 기능을 모두 수행하는 만능 명령어 (여전히 많이 사용됨)

* `이동 (Switch)`

  ```bash
  # 'feature/login' 브랜치로 이동
  git checkout feature/login
  ```

* `생성 후 이동 (Create & Switch)`

  ```bash
  # 신규 branch 'feature/signup' 생성 및 이동
  git checkout -b feature/signup
  ```

* `파일 복구 (Restore)`

  ```bash
  # 변경된 파일 복구
  git checkout -- README.md
  ```

* `독립적인 브랜치 생성 (Orphan)`

  ```bash
  # 이력이 없는 'gh-pages' 생성 및 이동
  git checkout --orphan gh-pages
  ```

### 2) 권장 방식 (Git 2.23+) : `git switch` & `git restore`

`git checkout`의 기능을 명확히 분리하여 도입된 명령어

* ``git switch`: 브랜치 이동`

  ```bash
  # 브랜치 이동
  git switch feature/login

  # 브랜치 생성 및 이동 (-c: create)
  git switch -c feature/signup
  
  # 이력이 없는 독립적인 브랜치 생성 (Orphan)
  git switch --orphan gh-pages
  ```

* ``git restore`: 파일 복구`

  ```bash
  # 파일 변경사항 복구 (HEAD 상태로)
  git restore README.md
  
  # 스테이징된 파일 내리기 (Unstage)
  git restore --staged README.md
  ```

### 3) 명령어 비교

| 동작                     | 기존 명령어 (`git checkout`)     | 최신 명령어 (`git switch` / `restore`) |
| :----------------------- | :------------------------------- | :------------------------------------- |
| 브랜치 이동              | `git checkout <branch>`          | `git switch <branch>`                  |
| 브랜치 생성 및 이동      | `git checkout -b <branch>`       | `git switch -c <branch>`               |
| 독립 브랜치(Orphan) 생성 | `git checkout --orphan <branch>` | `git switch --orphan <branch>`         |
| 파일 복구                | `git checkout -- <file>`         | `git restore <file>`                   |

---

## 3. 병합 : `git merge`

분리된 작업 공간에서 완료된 내용을 다시 하나로 병합

### 1) 일반 병합 (Merge) -> 브랜치의 이력을 그대로 유지

'받는 쪽(Target)' 브랜치로 이동한 뒤, '가져올(Source)' 브랜치를 병합

```bash
# 1. 메인 브랜치로 이동 (받는 쪽)
git checkout master

# 2. 기능 브랜치 병합 (가져올 쪽)
git merge feature/login
```

### 2) 스쿼시 병합 (Squash Merge)

가져올 브랜치의 모든 커밋 이력을 압축, 현재 브랜치에 새로운 커밋 하나로 추가 -> 개발 과정을 숨기고 결과물만 남길 때 사용

```bash
# 1. 메인 브랜치로 이동
git checkout master

# 2. 기능 브랜치를 압축하여 병합 (커밋은 생성되지 않음)
git merge --squash feature/login

# 3. 하나의 커밋으로 저장
git commit -m "Add login feature (Squashed)"
```

### 비교: 커밋 압축 vs 스쿼시 병합

| 구분 | 커밋 압축 (`rebase -i`)                              | 스쿼시 병합 (`merge --squash`)                               |
| :--- | :--------------------------------------------------- | :----------------------------------------------------------- |
| 목적 | `내 브랜치 정리`<br>작업 내역을 깔끔하게 다듬기 위함 | `병합 시 정리`<br>다른 브랜치를 가져올 때 하나로 퉁치기 위함 |
| 결과 | 현재 브랜치의 커밋 개수가 줄어듦                     | 대상 브랜치에 새로운 커밋 1개로 추가됨                       |
| 시점 | 작업 중간중간, 혹은 PR 올리기 전                     | 작업 완료 후 메인 브랜치에 합칠 때                           |
