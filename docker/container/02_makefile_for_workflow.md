# Make를 이용한 워크플로우 자동화

복잡하고 긴 Docker 명령어를 `make`를 이용해 짧은 단축키로 추상화하여 관리 효율성 증대

## 목차

1. [Make 개요 (Overview)](#1-make-개요-overview)
2. [워크플로우 구성 (Workflow)](#2-워크플로우-구성-workflow)

## 1. Make 개요 (Overview)

파일 종속성 기반의 빌드 자동화 도구이나, Docker 명령어 단축기로 널리 활용됨

### 사용 이유

1. 단순화: 복잡한 옵션(`-p`, `-v`, `--gpus`) 암기 불필요
2. 일관성: 팀원 간 동일한 실행 커맨드 공유
3. 의존성: `run` 실행 전 `build` 자동 수행 등 순서 제어

## 2. 워크플로우 구성 (Workflow)

프로젝트 루트에 `Makefile`을 생성하여 정의

### Makefile 작성 예시

```makefile
# 변수 정의
IMAGE_NAME := my-app
CONTAINER_NAME := my-container

# 타겟 정의 (.PHONY는 파일명 충돌 방지)
.PHONY: build run stop clean

# 1. 이미지 빌드
build:
    docker build -t $(IMAGE_NAME) .

# 2. 컨테이너 실행 (빌드 후 실행)
run: build
    docker run -d --rm --name $(CONTAINER_NAME) -p 8000:8000 $(IMAGE_NAME)

# 3. 컨테이너 중지
stop:
    docker stop $(CONTAINER_NAME)

# 4. 리소스 정리 (이미지 포함)
clean: stop
    docker rmi $(IMAGE_NAME)
```

### 사용법

터미널에서 `make {타겟명}` 입력

```bash
make run    # 빌드 + 실행
make clean  # 중지 + 삭제
```
