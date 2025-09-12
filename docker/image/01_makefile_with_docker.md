# Docker와 Makefile 함께 사용하기

Makefile을 Docker와 함께 사용하면 일반적인 Docker 명령을 자동화하고 단순화하여 개발 워크플로우를 더 효율적이고 일관성 있게 만들 수 있습니다. Makefile에서 복잡한 Docker 명령, 빌드 프로세스 또는 컨테이너 내 테스트 실행을 캡슐화하는 대상을 정의할 수 있습니다.

## 왜 Docker와 함께 Makefile을 사용해야 할까요?

*   **자동화:** 이미지 빌드, 컨테이너 실행 또는 정리와 같은 반복적인 작업을 자동화합니다.
*   **일관성:** 모든 팀 구성원이 동일한 명령과 구성을 사용하도록 합니다.
*   **단순성:** 복잡한 Docker 명령을 간단한 `make` 대상으로 추상화합니다.
*   **의존성 관리:** 작업 간의 의존성을 정의합니다(예: 컨테이너를 실행하기 전에 이미지 빌드).

## 예제 시나리오

컨테이너화하려는 간단한 Python 애플리케이션이 있다고 가정해 보겠습니다.

### 1. 프로젝트 구조

```
.
├── Dockerfile
├── app.py
└── Makefile
```

### 2. `app.py` (예제 Python 애플리케이션)

```python
# app.py
print("Hello from inside the Docker container!")
```

### 3. `Dockerfile` (Docker 이미지를 빌드하기 위해)

```dockerfile
# Dockerfile
FROM python:3.9-slim-buster
WORKDIR /app
COPY app.py .
CMD ["python", "app.py"]
```

### 4. `Makefile` (Docker 명령을 자동화하기 위해)

```makefile
# Makefile

# 이미지 이름과 컨테이너 이름에 대한 변수 정의
IMAGE_NAME := my-python-app
CONTAINER_NAME := my-python-container
PORT := 8000

.PHONY: build run stop clean shell logs

# Docker 이미지 빌드
build:
	@echo "[INFO] Building Docker image: $(IMAGE_NAME)"
	docker build -t $(IMAGE_NAME) .
	@echo "[OK] Docker image built successfully."

# Docker 컨테이너 실행
run: build
	@echo "[INFO] Running Docker container: $(CONTAINER_NAME)"
	docker run --rm --name $(CONTAINER_NAME) $(IMAGE_NAME)
	@echo "[OK] Docker container started."

# 분리 모드(백그라운드)에서 Docker 컨테이너 실행 및 포트 매핑
run-detached: build
	@echo "[INFO] Running Docker container in detached mode: $(CONTAINER_NAME)"
	docker run -d --rm --name $(CONTAINER_NAME) -p $(PORT):$(PORT) $(IMAGE_NAME)
	@echo "[OK] Docker container started in detached mode on port $(PORT)."

# 실행 중인 Docker 컨테이너 중지
stop:
	@echo "[INFO] Stopping Docker container: $(CONTAINER_NAME)"
	docker stop $(CONTAINER_NAME) || true
	@echo "[OK] Docker container stopped."

# 정리 (실행 중인 컨테이너 중지 및 이미지 제거)
clean: stop
	@echo "[INFO] Cleaning up Docker resources..."
	docker rmi $(IMAGE_NAME) || true
	@echo "[OK] Docker resources cleaned."

# 실행 중인 컨테이너 내부에서 셸 가져오기 (디버깅에 유용)
shell:
	@echo "[INFO] Attaching to shell in container: $(CONTAINER_NAME)"
	docker exec -it $(CONTAINER_NAME) /bin/bash

# 실행 중인 컨테이너의 로그 보기
logs:
	@echo "[INFO] Displaying logs for container: $(CONTAINER_NAME)"
	docker logs -f $(CONTAINER_NAME)
```

### 사용 방법

1.  **이미지 빌드:**
    ```bash
    make build
    ```
2.  **컨테이너 실행 (포그라운드, 종료 시 제거):**
    ```bash
    make run
    ```
3.  **컨테이너 실행 (분리/백그라운드):**
    ```bash
    make run-detached
    ```
4.  **분리된 컨테이너 중지:**
    ```bash
    make stop
    ```
5.  **정리 (컨테이너 중지 및 이미지 제거):**
    ```bash
    make clean
    ```
6.  **실행 중인 컨테이너 내부에서 셸 가져오기:**
    ```bash
    make shell
    ```
7.  **컨테이너 로그 보기:**
    ```bash
    make logs
    ```

이 `Makefile`은 일반적인 Docker 작업을 위한 편리한 인터페이스를 제공하여 특정 `docker` 명령을 추상화하고 프로젝트를 더 쉽게 관리할 수 있도록 합니다.
