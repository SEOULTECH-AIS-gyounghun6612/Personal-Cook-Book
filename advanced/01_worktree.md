# 독립 작업 공간 (Worktree & Orphan)

단일 저장소 내에서 물리적인 작업 디렉터리를 분리하거나, 기존 이력과 완전히 단절된 브랜치를 운용하는 고급 기법

## 목차

1. [워크트리 (Worktree)](#1-워크트리-worktree)
2. [고아 브랜치 (Orphan Branch)](#2-고아-브랜치-orphan-branch)
3. [활용 사례 (Use Case)](#3-활용-사례-use-case)

## 1. 워크트리 (Worktree)

하나의 저장소(`Repository`)를 여러 개의 폴더(물리적 공간)로 펼쳐서, 동시에 여러 브랜치를 체크아웃하여 작업하는 기능

### 1) 워크트리 생성 : `git worktree add [PATH] [BRANCH]`

새로운 폴더 경로에 특정 브랜치를 체크아웃

```bash
# ../hotfix-folder 위치에 hotfix 브랜치를 체크아웃하여 생성
git worktree add ../hotfix-folder hotfix
```

### 2) 워크트리 목록 : `git worktree list`

현재 연결된 워크트리 경로와 브랜치 정보 확인

```bash
git worktree list
# 출력 예:
# /project/main       (master)
# /project/hotfix-folder (hotfix)
```

### 3) 워크트리 삭제 : `git worktree remove [PATH]`

작업이 끝난 워크트리 연결을 해제 (폴더도 함께 정리됨)

```bash
git worktree remove ../hotfix-folder
```

---

## 2. 고아 브랜치 (Orphan Branch)

부모 커밋(이전 기록)이 없는 완전히 깨끗한 상태의 브랜치를 생성

### 독립적인 브랜치 생성

기존 파일들은 `Staged` 상태로 남지만, 커밋 이력은 연결되지 않음 (최초 커밋 시 새로운 뿌리가 됨)

```bash
# [권장] Git 2.27+ : switch 사용
git switch --orphan gh-pages

# [기존] checkout 사용
git checkout --orphan gh-pages

# 공통: 기존 파일이 필요 없다면 모두 삭제 후 시작
git rm -rf .
```

---

## 3. 활용 사례 (Use Case)

### Case 1: 작업 중단 없는 긴급 버그 수정 (Hotfix)

상황: `feature` 브랜치에서 복잡한 기능을 개발 중이라 작업 트리가 지저분한 상태(`Modified`)에서, 운영 서버(`main`)에 치명적 버그가 발생하여 즉시 수정해야 함.
해결: `git stash`로 작업을 감추고 브랜치를 전환하는 번거로움 없이, 핫픽스용 폴더를 만들어 즉시 대응.

1. 핫픽스 워크트리 생성:

   ```bash
   # 상위 폴더의 hotfix 디렉터리에 main 브랜치 기반으로 작업 공간 생성
   git worktree add ../hotfix main
   ```

2. 이동 및 수정:

   ```bash
   cd ../hotfix
   # (버그 수정 작업 진행...)
   git commit -am "Fix critical bug"
   git push origin main
   ```

3. 정리 및 복귀:

   ```bash
   cd ../original-project
   git worktree remove ../hotfix
   # 기존 작업 흐름을 끊지 않고 바로 이어서 개발 가능
   ```

### Case 2: 의존성 환경이 다른 두 버전 동시 관리 (Isolation)

상황: 레거시 버전(`v1`)과 신규 버전(`v2`)을 동시에 유지보수해야 함. 두 버전의 라이브러리 의존성(예: `node_modules`, `venv`)이 완전히 달라, 브랜치를 전환할 때마다 패키지를 다시 설치해야 하는 시간 낭비 발생.
해결: 아예 폴더를 분리하여 각자의 의존성 폴더를 독립적으로 유지.

1. 버전별 워크트리 구성:

   ```bash
   git worktree add ../project-v1 support/v1
   git worktree add ../project-v2 develop/v2
   ```

2. 독립적인 환경 구축:
   각 폴더(`../project-v1`, `../project-v2`)는 별개의 작업 공간이므로, 한 번만 의존성을 설치하면 브랜치를 이동해도 서로 영향을 주지 않음.

### Case 3: 빌드 결과물 배포 (Deploy Artifacts)

상황: 소스 코드는 `master`에서 관리하고, 빌드된 결과물(`dist/`)만 별도 브랜치(`gh-pages`)에 담아 배포하고 싶을 때.
해결: 워크트리와 고아 브랜치를 조합하여, 소스 코드와 결과물 폴더를 완전히 분리.

1. 워크트리 생성:
   메인 프로젝트 바깥에 `deploy` 폴더를 만들고 그곳을 배포용 브랜치(`gh-pages`)와 연결

    ```bash
    git worktree add ../deploy gh-pages
    ```

2. 고아 브랜치 초기화 (최초 1회):
   `deploy` 폴더가 빈 상태라면 고아 브랜치로 만들어 초기화 (이력 단절)

    ```bash
    cd ../deploy
    git switch --orphan gh-pages
    git rm -rf .
    ```

3. 배포 진행:
   메인 프로젝트에서 빌드한 결과물을 `deploy` 폴더로 복사 후 커밋/푸시

    ```bash
    # (메인 프로젝트에서 빌드 후)
    cp -r ./dist/* ../deploy/
    cd ../deploy
    git add .
    git commit -m "Deploy v1.0"
    git push origin gh-pages
    ```
