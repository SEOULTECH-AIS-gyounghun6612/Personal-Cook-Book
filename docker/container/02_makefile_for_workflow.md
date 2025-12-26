# Make를 이용한 Docker 워크플로우 자동화

## `make`란?

*   **정의**: 파일 종속성 기반의 빌드 자동화 도구. (`Makefile`에 규칙 정의)
*   **활용**: 복잡하고 긴 Docker 명령어를 짧은 단축키(Target)로 추상화.

## Docker와 함께 사용하는 이유

1.  **자동화 (Automation)**: 빌드, 실행, 정리 등의 반복 작업을 단일 명령으로 처리.
2.  **단순화 (Simplicity)**: 복잡한 옵션(`-p`, `-v`, `-e` 등)을 매번 입력할 필요 없음.
3.  **일관성 (Consistency)**: 팀원 모두가 동일한 설정과 명령어로 컨테이너 실행.
4.  **의존성 관리**: `run` 실행 전 `build` 강제 수행 등 작업 순서 제어.

## 워크플로우 예제

### 1. `Makefile` 작성

```makefile
# 변수 정의
IMAGE_NAME := my-app-image
CONTAINER_NAME := my-app-container
PORT := 8000

# .PHONY: 파일명과 타겟명 충돌 방지
.PHONY: build run stop clean shell logs

# 이미지 빌드
build:
	@echo "[INFO] Building image..."
	docker build -t $(IMAGE_NAME) .

# 컨테이너 실행 (백그라운드)
# 의존성: build 타겟 먼저 실행
run: build
	@echo "[INFO] Starting container..."
	docker run -d --rm --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME)

# 컨테이너 중지
stop:
	@echo "[INFO] Stopping container..."
	docker stop $(CONTAINER_NAME) || true

# 리소스 정리 (중지 후 이미지 삭제)
clean: stop
	@echo "[INFO] Removing image..."
	docker rmi $(IMAGE_NAME) || true

# 셸 접속 (디버깅)
shell:
	docker exec -it $(CONTAINER_NAME) /bin/bash

# 로그 확인
logs:
	docker logs -f $(CONTAINER_NAME)
```

### 2. 사용법

터미널에서 `make <타겟>` 명령으로 실행.

```bash
make run    # 이미지 빌드 + 컨테이너 백그라운드 실행
make logs   # 실행 중인 컨테이너 로그 확인
make shell  # 컨테이너 내부 접속
make clean  # 컨테이너 중지 및 이미지 삭제
```