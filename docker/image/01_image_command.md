# 이미지 기본 조작

Docker 이미지 관리와 레지스트리 상호작용에 필요한 핵심 명령어 정리.

## 0. 요약 비교

| 작업          | 명령어 | 대상 | 비고 |
| :-----------: | :--- | :--- | :--- |
| **로그인**    | [`login`](#레지스트리-로그인--docker-login-options-server) | 레지스트리 | 인증 정보 설정 |
| **생성**      | [`build`](#이미지-빌드--docker-build-options-path) | 이미지 | Dockerfile 기반 생성 |
| **목록 확인** | [`images`](#목록-확인--docker-images-options) | - | 로컬 보관 이미지 조회 |
| **내려받기**  | [`pull`](#이미지-다운로드--docker-pull-options-nametag) | 레지스트리 | 원격 저장소에서 복제 |
| **이름/태그** | [`tag`](#태그-지정--docker-tag-source_imagetag-target_imagetag) | 이미지 | 버전 관리 및 별칭 부여 |
| **업로드**    | [`push`](#이미지-업로드--docker-push-options-nametag) | 레지스트리 | 원격 저장소로 공유 |
| **상세 정보** | [`inspect`](#상세-정보-확인--docker-inspect-image) | 이미지 | 레이어, 환경변수 등 확인 |
| **삭제**      | [`rmi`](#이미지-삭제--docker-rmi-options-image) | 이미지 | 로컬 저장 공간 확보 |

## 1. 레지스트리 인증

### 레지스트리 로그인 : `docker login [OPTIONS] [SERVER]`

**설명**: Docker Hub 또는 사설 레지스트리에 인증. 업로드(`push`) 및 비공개 이미지 다운로드(`pull`) 전 필수 단계.

**사용 예시**:
```bash
# Docker Hub 로그인 (Username, Password 입력 필요)
docker login

# 특정 사설 레지스트리 로그인
docker login my-registry.com
```

### 로그아웃 : `docker logout [SERVER]`

**사용 예시**:
```bash
docker logout
```

## 2. 이미지 생성

### 이미지 빌드 : `docker build [OPTIONS] PATH`
*상세 내용은 [02_dockerfile_for_image.md](./02_dockerfile_for_image.md) 참고.*

## 3. 이미지 관리 및 태그 수정

### 목록 확인 : `docker images [OPTIONS]`

**주요 옵션**:
* `-a`: 중간 레이어 이미지 포함 전체 조회.
* `-q`: 이미지 ID만 출력.

**사용 예시**:
```bash
# 로컬 이미지 목록 확인
docker images
```

### 이미지 다운로드 : `docker pull [OPTIONS] NAME[:TAG]`

**주요 옵션**:
* `-a`: 저장소의 모든 태그 이미지 다운로드.

**사용 예시**:
```bash
# 최신 버전의 Ubuntu 이미지 다운로드
docker pull ubuntu:latest

# 특정 버전의 Python 이미지 다운로드
docker pull python:3.9-slim
```

### 태그 지정 : `docker tag SOURCE_IMAGE[:TAG] TARGET_IMAGE[:TAG]`

**설명**: 기존 이미지에 새로운 이름이나 태그(버전)를 부여. 레지스트리 업로드 전 필수 단계.

**사용 예시**:
```bash
# 'my-app' 이미지에 버전 태그 추가
docker tag my-app:latest my-app:v1.0.0

# Docker Hub 업로드를 위해 계정명 포함 태그 생성
docker tag my-app:latest username/my-app:latest
```

### 이미지 업로드 : `docker push [OPTIONS] NAME[:TAG]`

**사용 예시**:
```bash
# 원격 저장소(Docker Hub 등)로 이미지 전송
docker push username/my-app:latest
```

## 4. 정보 및 삭제

### 상세 정보 확인 : `docker inspect IMAGE`

**사용 예시**:
```bash
# 이미지의 구성 정보(JSON 형식) 출력
docker inspect ubuntu:latest
```

### 이미지 삭제 : `docker rmi [OPTIONS] IMAGE`

**주요 옵션**:
* `-f`: 컨테이너에서 사용 중이더라도 강제 삭제 (Force).

**사용 예시**:
```bash
# 특정 이미지 삭제
docker rmi python:3.9-slim

# 사용하지 않는 모든 이미지 일괄 삭제
docker image prune -a
```