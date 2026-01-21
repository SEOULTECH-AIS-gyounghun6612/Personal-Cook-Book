# Docker 사용 가이드

이 문서는 Docker의 핵심 개념부터 설치, 이미지 및 컨테이너 관리, 그리고 워크플로우 구성을 위한 전반적인 사용법을 제시함.

## 1. Docker 기본 (Basics)

Docker는 애플리케이션을 신속하게 구축, 테스트 및 배포할 수 있는 소프트웨어 플랫폼.

### Docker 핵심 개념 및 설치

1. `Docker (도커)`: 컨테이너 기반의 가상화 플랫폼
  * [Docker란 무엇인가](./00_what_is_docker.md): Docker의 개념, 가상머신(VM)과의 차이점 및 장점

2. `Installation (설치)`: Docker 엔진 및 환경 구성
  * [Ubuntu에 Docker 설치](./01_install_on_ubuntu.md): Ubuntu 환경에서의 Docker 설치 및 설정 방법

---

## 2. Docker Image (이미지)

이미지는 컨테이너 실행에 필요한 파일과 설정값 등을 포함한 불변(Immutable) 파일.

### 이미지 관리

* [이미지(Image)란](./image/00_what_is_image.md): 도커 이미지의 개념과 구조 이해

* [이미지 명령어](./image/01_image_command.md): 이미지 검색(`search`), 다운로드(`pull`), 조회(`ls`) 및 삭제(`rm`)

* [Dockerfile 작성](./image/02_dockerfile_for_image.md): `Dockerfile`을 이용한 이미지 빌드(`build`) 및 커스텀 이미지 생성

---

## 3. Docker Container (컨테이너)

컨테이너는 이미지를 실행한 상태로, 격리된 공간에서 애플리케이션이 동작하는 프로세스.

### 컨테이너 운용

* [컨테이너(Container)란](./container/00_what_is_container.md): 컨테이너의 생명주기 및 격리 기술 이해

* [컨테이너 명령어](./container/01_container_command.md): 컨테이너 실행(`run`), 중지(`stop`), 조회(`ps`) 및 접속(`exec`)

* [워크플로우 자동화](./container/02_makefile_for_workflow.md): `Makefile`을 활용한 반복적인 Docker 명령어 관리 및 워크플로우 효율화
