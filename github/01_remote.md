# 원격 저장소 (Remote)

로컬 저장소를 GitHub 원격 저장소와 연결하여 변경 사항을 동기화함.

## 목차

1. [연결 (Connect)](#1-연결-connect)
2. [업로드 (Push)](#2-업로드-push)
3. [가져오기 및 정리 (Fetch & Prune)](#3-가져오기-및-정리-fetch--prune)
4. [내려받기 (Pull)](#4-내려받기-pull)
5. [관리 (Manage)](#5-관리-manage)

## 1. 연결 (Connect)

로컬 저장소에 GitHub 원격 저장소 주소를 등록하여 두 저장소를 연결함.

### 주소 등록 : `git remote add [NAME] [URL]`

원격 저장소 주소를 특정 이름(별명)으로 등록함. 관례적으로 기본 이름은 `origin`을 사용함.

```bash
# 원격 저장소(origin) 등록 (HTTPS 주소 사용)
git remote add origin https://github.com/user/my-project.git
```

### 연결 확인 : `git remote -v`

등록된 원격 저장소 목록과 주소를 확인함.

```bash
# 연결된 저장소 목록 상세 확인
git remote -v
# 출력 예시: origin  https://github.com/... (fetch/push)
```

## 2. 업로드 (Push)

로컬의 커밋 내역을 원격 저장소로 전송하여 공유함.

### 원격 업로드 : `git push [REMOTE] [BRANCH]`

지정된 원격 저장소 브랜치로 로컬 변경 사항을 업로드함.

```bash
# origin 저장소의 master 브랜치로 푸시
git push origin master
```

### 업스트림 설정 : `git push -u [REMOTE] [BRANCH]`

최초 1회 실행하여 로컬 브랜치와 원격 브랜치를 연결(Tracking)함. 이후에는 `git push`만 입력해도 자동 업로드됨.

```bash
# 업스트림 설정과 함께 푸시
git push -u origin master

# 이후 간편 사용
git push
```

## 3. 가져오기 및 정리 (Fetch & Prune)

원격 저장소의 변경 내역을 확인하거나 삭제된 브랜치 정보를 정리함.

### 상태 확인 : `git fetch [REMOTE]`

원격 저장소의 최신 데이터(커밋, 브랜치 등)를 가져오지만 로컬 브랜치와 병합하지는 않음. 원격의 최신 상태를 확인할 때 사용함.

```bash
# origin 저장소의 최신 이력 가져오기
git fetch origin
```

### 업데이트 및 정리 : `git fetch --prune [REMOTE]`

원격의 최신 데이터를 가져오면서, 원격 저장소에서 삭제된 브랜치에 대한 로컬 추적 정보를 자동으로 제거함.

*   **`--prune` (또는 `-p`) 옵션**: 원격(Remote)에는 존재하지 않으나 로컬 목록(`git branch -a`)에 남아있는 유령 브랜치 정보를 정리함.

```bash
# 최신 이력을 가져오며 삭제된 브랜치 정보 정리
git fetch --prune origin

# 단축형
git fetch -p origin
```

## 4. 내려받기 (Pull)

원격 저장소의 최신 변경 사항을 가져와 로컬 작업에 합침.

### 원격 동기화 : `git pull [REMOTE] [BRANCH]`

원격 저장소 내용을 가져와(`fetch`) 현재 브랜치에 즉시 병합(`merge`)함.

```bash
# 원격 변경 사항을 가져와 병합
git pull origin master
```

* 동작 원리: `git fetch` (데이터 다운로드) + `git merge` (코드 합치기)
* 충돌(Conflict): 동일 파일 수정 시 자동 병합이 실패하며 사용자가 직접 해결해야 함.

## 5. 관리 (Manage)

등록된 원격 저장소 주소를 변경하거나 연결을 해제함.

### 주소 변경 : `git remote set-url [NAME] [NEW_URL]`

저장소 이름 변경 등으로 URL이 바뀌었을 때 정보를 갱신함.

```bash
# origin 저장소의 주소 변경
git remote set-url origin https://github.com/new-user/new-project.git
```

### 연결 삭제 : `git remote remove [NAME]`

로컬과 원격 사이의 연결 정보를 삭제함. (원격 저장소 파일은 유지됨)

```bash
# origin 연결 정보 삭제
git remote remove origin
```