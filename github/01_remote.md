# 원격 저장소 (Remote)

로컬 저장소를 GitHub 원격 저장소와 연결하여 변경 사항을 동기화

## 목차

1. [복제 : git clone](#1-복제--git-clone)
2. [원격 관리 : git remote](#2-원격-관리--git-remote)
3. [업로드 : git push](#3-업로드--git-push)
4. [가져오기 : git fetch](#4-가져오기--git-fetch)
5. [내려받기 : git pull](#5-내려받기--git-pull)

## 1. 복제 : `git clone`

원격 저장소의 전체 내용을 로컬로 복사하여 새로운 저장소를 생성 (가장 일반적인 시작 방법)

### 1) 저장소 복제 (Basic Clone)

원격 저장소의 코드를 로컬 컴퓨터로 내려받음 (자동으로 원격 저장소 별명이 `origin`으로 등록됨)

```bash
# 원격 저장소 전체 복제
git clone https://github.com/user/my-project.git
```

### 2) 브랜치 지정 복제 (Branch Clone)

특정 브랜치만 체크아웃하거나, 해당 브랜치의 이력만 가져와서 복제

* 일반 특정 브랜치 복제 (`-b`): 전체 브랜치 이력을 다 가져오되, 완료 후 해당 브랜치를 자동으로 선택함.
* 단일 브랜치 전용 복제 (`--single-branch`): 지정한 브랜치의 데이터만 가져와 저장소 용량을 최소화함. (다른 브랜치로 전환 불가)

```bash
# dev 브랜치만 타겟으로 복제
git clone -b dev --single-branch https://github.com/user/my-project.git

# [심화] 브랜치 지정 + 서브모듈까지 한 번에 복제
git clone -b dev --single-branch --recurse-submodules https://github.com/user/my-project.git
```

### 3) 서브모듈 포함 복제 (Recursive Clone)

저장소 내부에 서브모듈이 포함된 경우, 이를 자동으로 초기화하고 함께 복제

저장소 내부에 서브모듈이 포함된 경우, 이를 자동으로 초기화하고 함께 복제

```bash
# 모든 서브모듈을 포함하여 한 번에 복제
git clone --recurse-submodules https://github.com/user/my-project.git
```

---

## 2. 원격 관리 : `git remote`

로컬 저장소와 원격 저장소 간의 연결을 설정, 확인 및 관리

### 1) 주소 등록 (Add)

원격 저장소 주소를 특정 이름(별명)으로 등록 -> 관례적으로 기본 이름은 `origin`을 사용

```bash
# 원격 저장소(origin) 등록 (HTTPS 주소 사용)
git remote add origin https://github.com/user/my-project.git
```

### 2) 연결 확인 (List)

등록된 원격 저장소 목록과 주소를 확인

```bash
# 연결된 저장소 목록 상세 확인
git remote -v
# 출력 예시: origin  https://github.com/... (fetch/push)
```

### 3) 주소 변경 (Set-URL)

저장소 이름 변경 등으로 URL이 바뀌었을 때 정보를 갱신

```bash
# origin 저장소의 주소 변경
git remote set-url origin https://github.com/new-user/new-project.git
```

### 4) 연결 삭제 (Remove)

로컬과 원격 사이의 연결 정보를 삭제 (원격 저장소 파일은 유지됨)

```bash
# origin 연결 정보 삭제
git remote remove origin
```

---

## 3. 업로드 : `git push`

로컬의 커밋 내역을 원격 저장소로 전송하여 공유하거나, 원격 브랜치를 관리

### 1) 원격 업로드

지정된 원격 저장소 브랜치로 로컬 변경 사항을 업로드

```bash
# origin 저장소의 master 브랜치로 푸시
git push origin master
```

### 2) 업스트림 설정 (Upstream)

최초 1회 실행하여 로컬 브랜치와 원격 브랜치를 연결(Tracking) -> 이후에는 `git push`만 입력해도 자동 업로드됨.

```bash
# 업스트림 설정과 함께 푸시
git push -u origin master

# 이후 간편 사용
git push
```

### 3) 원격 브랜치 삭제 (Delete Remote Branch)

더 이상 필요하지 않은 원격 저장소의 브랜치를 삭제 (로컬 브랜치는 삭제되지 않음)

```bash
# origin 저장소의 'feature/login' 브랜치 삭제
git push origin --delete feature/login
```

---

## 4. 가져오기 : `git fetch`

원격 저장소의 변경 내역을 확인하거나 삭제된 브랜치 정보를 정리

### 1) 상태 확인

원격 저장소의 최신 데이터(커밋, 브랜치 등)를 가져오지만 로컬 브랜치와 병합하지는 않음 -> 원격의 최신 상태를 확인할 때 사용

```bash
# origin 저장소의 최신 이력 가져오기
git fetch origin
```

### 2) 업데이트 및 정리 (Prune)

원격의 최신 데이터를 가져오면서, 원격 저장소에서 삭제된 브랜치에 대한 로컬 추적 정보를 자동으로 제거

* `--prune` (또는 `-p`) 옵션: 원격(Remote)에는 존재하지 않으나 로컬 목록(`git branch -a`)에 남아있는 유령 브랜치 정보를 정리

```bash
# 최신 이력을 가져오며 삭제된 브랜치 정보 정리
git fetch --prune origin

# 단축형
git fetch -p origin
```

---

## 5. 내려받기 : `git pull`

원격 저장소의 최신 변경 사항을 가져와 로컬 작업에 병합

### 1) 원격 동기화

원격 저장소 내용을 가져와(`fetch`) 현재 브랜치에 즉시 병합(`merge`)

```bash
# 원격 변경 사항을 가져와 병합
git pull origin master
```

* 동작 원리: `git fetch` (데이터 다운로드) + `git merge` (코드 합치기)
* 충돌(Conflict): 동일 파일 수정 시 자동 병합이 실패하며 사용자가 직접 해결 필요
