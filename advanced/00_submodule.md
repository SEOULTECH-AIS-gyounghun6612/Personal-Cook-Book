# Git Submodule (하위 모듈 관리)

하나의 저장소 안에 다른 저장소를 포함 관리하는 고급 기능.
주로 공통 라이브러리나 모듈을 별도 프로젝트로 분리하여 재사용 시 유용.

## 목차

1. [Submodule 등록 (Add)](#1-submodule-등록-add)

2. [초기화 및 갱신 (Init & Update)](#2-초기화-및-갱신-init--update)

3. [Submodule 설정 변경 및 이동 (Modify & Move)](#3-submodule-설정-변경-및-이동-modify--move)

4. [Submodule 제거 (Remove)](#4-submodule-제거-remove)

---

## 1. Submodule 등록 (Add)

외부 저장소를 현재 프로젝트 하위 디렉터리로 추가.

### 서브모듈 추가 : `git submodule add <저장소_URL> <경로>`

지정된 경로에 외부 저장소 등록.

```bash
# 예시: 'my-library'를 'libs/my-library' 폴더에 추가
git submodule add https://github.com/example/my-library.git libs/my-library
```

### 특정 브랜치 지정 추가 : `git submodule add -b <브랜치명> <URL> <경로>`

기본 브랜치 외 특정 기능 브랜치 추적 설정.

```bash
# 'feature/new-api' 브랜치를 서브모듈로 추가
git submodule add -b feature/new-api https://github.com/example/my-library.git libs/new-api-feature
```

---

## 2. 초기화 및 갱신 (Init & Update)

서브모듈 포함 프로젝트의 초기 설정 및 최신 상태 유지.

### 서브모듈 포함 클론 : `git clone --recursive <URL>`

상위 프로젝트 클론 시 내부 서브모듈까지 일괄 다운로드.

```bash
git clone --recursive https://github.com/example/main-project.git
```

### 서브모듈 초기화 및 업데이트 : `git submodule update --init --recursive`

클론 후 비어있는 서브모듈 디렉터리 초기화 및 데이터 다운로드.

```bash
# .gitmodules 설정 기반 초기화 및 코드 다운로드
git submodule update --init --recursive
```

### 원격 최신 변경사항 반영 : `git submodule update --remote`

원격 저장소의 새 커밋 확인 및 로컬 서브모듈 반영.

```bash
# 각 서브모듈의 지정된 브랜치 최신 커밋 추적 및 업데이트
git submodule update --remote
```

---

## 3. Submodule 설정 변경 및 이동 (Modify & Move)

원격 저장소 주소 변경 또는 프로젝트 내 위치 이동.

### 서브모듈 URL 변경

원격 저장소 주소 변경 시 설정 및 정보 갱신.

#### 방법 1: `set-url` 명령어 사용 (권장)

Git 2.25 이상 지원. 설정 파일 수정 및 동기화 자동 처리.

```bash
# 'libs/my-library'의 URL을 새로운 주소로 변경
git submodule set-url libs/my-library https://github.com/new-org/my-library.git
```

#### 방법 2: 설정 파일 직접 수정

수동 설정 변경 방식.

1. `.gitmodules` 파일 내 `url` 값 수정.
2. 변경된 URL 내부 설정 반영.

    ```bash
    git submodule sync
    ```

3. 서브모듈 업데이트 및 연결 확인.

    ```bash
    git submodule update --init --recursive
    ```

### 서브모듈 경로 이동 : `git mv <옛_경로> <새_경로>`

서브모듈 디렉터리 이동. `git mv` 사용 시 설정 정보 자동 변경.

```bash
# 'libs/my-library'를 'vendor/my-library'로 이동
git mv libs/my-library vendor/my-library
```

---

## 4. Submodule 제거 (Remove)

프로젝트에서 서브모듈 완전 제거 (순서 준수).

### 서브모듈 연결 해제 : `git submodule deinit -f <경로>`

`.git/config` 설정 제거 및 로컬 파일 삭제.

```bash
git submodule deinit -f libs/my-library
```

### 서브모듈 파일 및 설정 삭제 : `git rm <경로>`

`.gitmodules` 정보 제거 및 작업 트리 폴더 삭제.

```bash
git rm libs/my-library
```

### 내부 데이터 완전 삭제 : `rm -rf .git/modules/<경로>`

Git 내부 디렉터리에 남은 이력 데이터 삭제.

```bash
rm -rf .git/modules/libs/my-library
```
